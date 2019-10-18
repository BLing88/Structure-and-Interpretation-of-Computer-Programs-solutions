(define (reverse x)
    (define (reverse-iter x)
        (define (append list1 list2)
            (if (null? list1)
                list2
                (cons (car list1) (append (cdr list1) list2))))
        (if (null? (cdr x))
            x
            (append (reverse-iter (cdr x)) (list (car x)))))
    (reverse-iter x))

(newline)
(reverse (list 1 2 3 4))
(reverse (list "a" "b" "c" "d"))
