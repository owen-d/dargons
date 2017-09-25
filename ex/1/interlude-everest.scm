;; from https://www.reddit.com/r/dailyprogrammer/comments/71gbqj/20170920_challenge_332_intermediate_training_for/

;; input:
;; 0 8 4 12 2 10 6 14 1 9 5 13 3 11 7 15
;; output:
;; 0 2 6 9 11 15

;; note: I'm not using indices as the result, but rather the values.

;; want to go from the back, as we don't have to attempt all branches.

(define (everest input)
  (define (last col)
    (cond ((null? col) col)
          ((null? (cdr col)) (car col))
          (else (last (cdr col)))))
  ;; higher will determine if the next value is higher than the previous values (helps initialization when we don't have an accumulator yet)
  (define (higher? x accum)
    (if (null? accum)
        #t
        (> x (last accum))))
  ;; compare results of skipping vs not skipping. sorts first by highest peak, then by # of peaks.
  (define (compare-results a b)
    (cond
     ((= (last a) (last b))
      (if (> (length a) (length b))
          a
          b))
     ((> (last a) (last b)) a)
     (else b)))
  (define (_everest accum col)
    ;; if col is empty, we've reached beginning; return
    (if (null? col)
        accum
        ;; assuming we reversed the inputs, next will be the next peak to check
        ;; and last will be the last peak added.
        ;; max is the highest peak in the current column.
        (let ((next (car col))
              (rest (cdr col)))
          ;; we found a higher peak. use that instead.
          (cond ((higher? next accum) (_everest (list next) rest))
                ;; next is higher than our most recent. must skip
                ((> next (car accum)) (_everest accum rest))
                ;; not higher: so fork into 2 paths, one which adds this & one skips.
                ;; take the best result from the fork.
                (else (compare-results (_everest (cons next accum) rest)
                                       (_everest accum rest)))))))
  (_everest '() (reverse input)))

(everest '(0 8 4 12 2 10 6 14 1 9 5 13 3 11 7 15))
;; note: this currently prioritizes ending height & then length, but doesn't care about middling height
