; (define (reverse x)
;     (define (reverse-iter x)
;         (define (append list1 list2)
;             (if (null? list1)
;                 list2
;                 (cons (car list1) (append (cdr list1) list2))))
;         (if (null? (cdr x))
;             x
;             (append (reverse-iter (cdr x)) (list (car x)))))
;     (reverse-iter x))

(define (reverse x)
    (define (reverse-iter x answer)
        (if (null? x)
            answer
            (reverse-iter (cdr x) (cons (car x) answer))))
    (reverse-iter x '()))

(newline)
(display (reverse (list 1 2 3 4)))
(newline)
(display (reverse (list "a" "b" "c" "d")))
