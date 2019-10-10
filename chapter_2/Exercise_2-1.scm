(define (make-rat n d)
    (define (gcd a b)
        (if (= b 0)
            a
            (gcd b (remainder a b))))
    (let ((g (abs (gcd n d))))
        (if (> d 0)
            (cons (/ n g) (/ d g))
            (cons (- (/ n g)) (- (/ d g))))))

(define (numer x)
    (car x))

(define (denom x)
    (cdr x))

(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))

(print-rat (make-rat 3 4))
(print-rat (make-rat 9 6))
(print-rat (make-rat -2 4))
(print-rat (make-rat 100 -2))
(print-rat (make-rat -32 93))