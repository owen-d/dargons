### special forms
- not always evaluated
- if, and, or

### Applicative Order:
- evaluate operator & operands , then apply
```lisp
(+ (square (+ 5 1)) (square (+ 1 2)))
;->
(+ (* 6 6) (* 3 3))
;->
(+ 36 9)
45
```

### Normal Order:
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

MIT Scheme uses applicative order.

### Free & Bound variables
#### Bound
Bound variables are defined & used within a function. Consistently changing the name of a bound variable within the function will not yield any difference.
> In a procedure definition, the bound variables declared as the formal parameters of the procedure have the body of the procedure as their scope.
Below, `+` is free, but `x` is bound.
```lisp
(define (double x)
  (+ x x))
```
#### Free
Free variables have dangling references to names
> If a variable is not bound, we say that it is free.
