
(define (improve guess x)
  (average guess (/ x guess)))

;; this version will continue until a guess is within a % threshold from x. Note that since x is squared, this actually isn't good for large numbers, as sqrts become smaller in a percentage sense as numbers scale higher. This was my first idea and is just included for educational purposes.
(define (good-enough-2? guess x threshold)
  (< (abs (- (square guess) x)) (* x threshold)))

(define (sqrt-iter-2 guess x threshold)
  (if (good-enough-2? guess x threshold) guess
      (sqrt-iter-2 (improve guess x) x threshold)))

(define (sqrt-2 x threshold)
  (sqrt-iter-2 1 x threshold))

(define (percentage-diff-sqrt x threshold)
                                        ; compares computed x to x.
  (/ (square (sqrt-2 x threshold)) x))

(percentage-diff-sqrt 0.00001 0.001)


;; This version will continue until the next guess is within a predefined range from the previous guess

(define (good-enough-babystep guess oldguess)
  (< (abs (- guess oldguess)) 0.001))

(define (sqrt-iter-babystep guess oldguess x)
  (if (good-enough-babystep guess oldguess)
      guess
      (sqrt-iter-babystep (improve guess x) guess x)))

(define (sqrt-babystep x)
  (sqrt-iter-babystep 1.0 0 x))

(sqrt-babystep 1000)
