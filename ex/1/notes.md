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

### Processes, Recursive & Iterative (& their distinction from procedures)
Processes describe the evolution of an procedure or set of procedures, and the shapes they form with respect to space and time. big O
#### Recursive
Consider the following, & the shape of its evaluation:
```lisp
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
```
![linear recursive process](static/linear_recursive_process.gif)
> The expansion occurs as the process builds up a chain of deferred operations (in this case, a chain of multiplications). The contraction occurs as the operations are actually performed. This type of process, characterized by a chain of deferred operations, is called a recursive process. 
#### Iterative
Now, consider this definition:
```lisp
(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))
```
![linear iterative process](static/linear_iterative_process.gif)
> In general, an iterative process is one whose state can be summarized by a fixed number of state variables, together with a fixed rule that describes how the state variables should be updated as the process moves from state to state and an (optional) end test

