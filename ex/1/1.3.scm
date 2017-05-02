(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
(define (largest x y)
  (if (> x y) x y))
(define (largest-sum-squares x y z)
  (if (= (largest x y) x)
      (sum-of-squares x (largest y z))
      (sum-of-squares y (largest x z))))

;(largest-sum-squares 2 3 4)

