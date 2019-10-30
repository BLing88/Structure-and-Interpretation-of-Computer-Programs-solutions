(define (deep-reverse x)
    (define (reverse-iter x answer)
        (if (null? x)
            answer
            (reverse-iter (cdr x) (cons (deep-reverse (car x)) answer))))
    (cond ((null? x) '())
        ((not (pair? x)) x)
        (else (reverse-iter x '()))))

(define x (list (list 1 2) (list 3 4)))
(newline)
(display "x = ")
(display x)
(newline)
(display "deep reversed x = ")
(display (deep-reverse x))

(define y (list (list (list 1 2) (list 3 (list "a" "b" "c" "d"))) (list 5 6 7) (list 8 9 10)))
(newline)
(display "y = ")
(display y)
(newline)
(display "deep reversed y = ")
(display (deep-reverse y))