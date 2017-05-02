special forms
- not always evaluated
- if, and, or

Applicative Order:
- evaluate operator & operands , then apply
```lisp
(+ (square (+ 5 1)) (square (+ 1 2)))
;->
(+ (* 6 6) (* 3 3))
;->
(+ 36 9)
45
```

Normal Order:
- don't evaluate operands until values are needed
```lisp
(+ (square (+ 1 5)) (square (+ 1 2)))
;->
(+ (* (+ 1 5) (+ 1 5)) (* (+ 1 2) (+ 1 2)))
;->
(+ (* 6 6) (* 3 3))
;->
(+ 36 9)
;->
45
```

Lisp uses applicative order.
