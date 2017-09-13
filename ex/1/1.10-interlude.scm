;; utils
(define (fold fn init col)
  (if (null? col)
      init
      (fold fn
       (fn init (car col))
       (cdr col))))

(define (sum col)
  (fold + 0 col))

(define coins '(50 25 10 5 1))

(define (find-change amount coins)
  (cond ((= amount 0) 1)
        ((< amount 0) 0)
        ((> amount 0) (sum (map (lambda (coin)
                                  (find-change (- amount coin)
                                               ;; member is handy: it generates
                                               ;; the sublist where the first
                                               ;; item is equal to coin
                                               ;; we generate sublists to remove
                                               ;; duplicate permutations
                                               (member coin coins)))
                                coins)))))

(find-change 100 coins)

;; -> 292
