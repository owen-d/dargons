;; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process

;; recursive
(define (desired n)
  (if (< n 3)
      n
      (+ (desired (- n 1))
         (* 2 (desired (- n 2)))
         (* 3 (desired (- n 3))))))

;; iterative -- did not come up with the iterative solution myself
(define (f n)
  (define (iter a b c count)
    (if (= count 0)
        a
        (iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (iter 0 1 2 n))
