;; utils
;; fun recursive process implementation of map
(define (map fn col)
  (if (null? col)
      '()
      (cons (fn (car col))
            (map fn (cdr col)))))

;; iterative process version. Hello, TCO!
(define (iter-map fn col)
  (define (_iter-map accum fn col)
    (if (null? col)
        accum
        (_iter-map (append accum
                           (list (fn (car col))))
                   fn
                   (cdr col))))
  (_iter-map '() fn col))

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

;; impl without the fold. same idea, but shells out the mapping to the nature of its recursive procedure.
(define (find-change-two amount coins)
  (cond ((= amount 0) 1)
        ((< amount 0) 0)
        (else (+ (find-change-two (- amount (first coins)) coins)
                 ;; this will just do the first half of the equation if there is only 1 coin left.
                 (if (null? (cdr coins)) 0
                     (find-change-two amount (cdr coins)))))))

(find-change-two 100 coins)

(find-change 100 coins)

;; -> 292
