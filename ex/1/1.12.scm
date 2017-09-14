;; using 1 indexing, the # of columns in a row = row #
(define (pascal r c)
  (define (oob r c)
    (or (< r 1)
        (< c 1)
        (> c r)))
  ;; need oob check first
  (cond ((oob r c) 0)
        ((< r 3) 1)
        (else (+ (pascal (- r 1) (- c 1))
                 ;; note: no need to increment the 2nd column, as the row above has 1 less column
                 (pascal (- r 1) c)))))

(pascal 2 1)
;; => 1
(pascal 3 2)
;; => 2
(pascal 4 3)
;; => 3
(pascal 5 3)
;; => 6


;; really clever way to do it (& efficient!); never have to calculate or check out of bounds:
(define (pascal r c)
  (if (or (= c 1) (= c r))
      1
      (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))
