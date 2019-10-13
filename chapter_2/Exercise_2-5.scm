(define (cons a b)
    (* (expt 2 a) (expt 3 b)))

(define (car x)
    (define (car-iter x count)
        (if (not (exact-integer? (/ x 2)))
            count
            (car-iter (/ x 2) (+ count 1))))
    (car-iter x 0))

(define (cdr x)
    (define (cdr-iter x count)
        (if (not (exact-integer? (/ x 3)))
            count
            (cdr-iter (/ x 3) (+ count 1))))
    (cdr-iter x 0))

(define x (cons 4 9))
(newline)
(display x)
(newline)
(display (car x))
(newline)
(display (cdr x))