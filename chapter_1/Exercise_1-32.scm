(define (accumulate combiner null-value term a next b)
    (define (accumulate-iter accumulation current-term)
        (if (> current-term b)
            (combiner accumulation (term null-value))
            (accumulate-iter 
                (combiner accumulation (term current-term))
                (next current-term))))
    (accumulate-iter (term a) (next a)))

(define (add a b)
    (+ a b))

(define (add-one a)
    (+ a 1))

(define (cube x)
    (* x x x ))

(define (sum a b f)
    (accumulate add 0 f a add-one b))
 
(sum 1 14 cube)