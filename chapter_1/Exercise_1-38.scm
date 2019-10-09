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

(define (n i)
    1.0)

(define (d i)
    (let ((j (/ (- i 2) 3)))
        (cond ((= i 1) 1.0)
            ((integer? j) (* 2 (+ j 1)))
            (else 1.0))))

(+ 2 (cont-frac n d 100))  ; returns 2.7182818
