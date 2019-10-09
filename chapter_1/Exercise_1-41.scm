(define (double f)
    (lambda (x) (f (f x))))

(define (inc x)
    (+ x 1))

; ((double inc) 5)

(((double (double double)) inc) 5) ; returns 5 + 16 = 21

; (double double) acting on inc gives a procedure applying inc 4 times, but applying double to (double double) applies (double double) to inc
; twice, meaning inc is doubled twice, so 4 * 2 * 2 = 16 times altogether 