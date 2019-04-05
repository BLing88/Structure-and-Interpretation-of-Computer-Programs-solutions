(define (fast-iter-exp b n)
    (define (is-odd? x)
        (if (= (modulo x 2) 1)
            #t
            #f))

    (define (iter-exp a b n)
        ;(newline)
        ;(display a)
        (cond ((= n 0) a)
            ((not (is-odd? n)) (iter-exp a (* b b) (/ n 2)))
            (else (iter-exp (* a b) b (- n 1)))))  ; b (/ (* b b) a) (- n 1)))))
    
        (iter-exp 1 b n))

(fast-iter-exp 3 4)


