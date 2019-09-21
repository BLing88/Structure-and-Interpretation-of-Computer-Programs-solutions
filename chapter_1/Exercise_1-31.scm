;; part a
(define (product current-term a compute-next-index b)
    (define (product-iter next-index result)
        (if (= next-index b)
            (* result 
                   (current-term b))
            (product-iter 
                (compute-next-index next-index)
                (* result 
                   (current-term next-index)))))
    (product-iter 
        a
        (current-term a)))

(define (add-one a)
    (+ a 1))

(define (identity a)
    a)

(define (factorial n)
    (product identity 1 add-one n))

(factorial 4)