(define (cont-frac n d k)
    (define (cont-frac-iter approx counter)
        (if (= counter 1)
            (/ (n counter) (+ 
                            (d counter)
                            approx))
            (cont-frac-iter (/ (n counter) (+ 
                                            (d counter)
                                            approx))
                            (- counter 1))))
    (cont-frac-iter 0 k))

(define (tan-cf x k)
    (define (n i)
        (if (= i 1)
            x
            (- (* x x))))
    (define (d i)
        (+ (* 2 (- i 1)) 1))
    (cont-frac n d k))

(tan-cf 0.5 100)  ; returns .5463024
(tan-cf 10.345 100)  ; returns 1.313868