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

; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            10) ; returns 0.6179775

; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            20)  ; returns 0.6180339

(define (cont-frac-recursive n d k)
    (if (= k 1)
        (/ (n k) (d k))
        (/ (n k) (+ (/ (n k) (d k)) (cont-frac-recursive n d (- k 1))))))

(cont-frac-recursive (lambda (i) 1.0)
           (lambda (i) 1.0)
           10) ; returns 0.6179775

(cont-frac-recursive (lambda (i) 1.0)
           (lambda (i) 1.0)
           20)  ; returns 0.61803398