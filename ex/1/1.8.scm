
(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (square guess))) 3))

(define (good-enough? guess oldguess threshold)
  (< (abs (- guess oldguess)) threshold))

(define (cubert-iter guess oldguess x threshold)
  (if (good-enough? guess oldguess threshold)
      guess
      (cubert-iter (improve guess x) guess x threshold)))

(define (cubert x)
  (cubert-iter 1.0 0 x 0.001))

(cubert 27)

