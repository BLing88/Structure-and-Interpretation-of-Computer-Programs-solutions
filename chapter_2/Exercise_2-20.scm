(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(define (same-parity x . rest)
    (define (is-even? x)
        (= 0 (remainder x 2)))

    (define (is-odd? x)
        (= 1 (remainder x 2)))

    (define (filtered-list filter x)
        (define (filter-iter accumulated-list x)
            (cond ((null? x) accumulated-list)
                ((filter (car x)) (filter-iter 
                                        (append accumulated-list (list (car x))) 
                                        (cdr x)))
                (else (filter-iter accumulated-list (cdr x)))))

        (filter-iter '() x))

    (if (is-even? x)
        (cons x (filtered-list is-even? rest))
        (cons x (filtered-list is-odd? rest))))

(newline)
(display (same-parity  0 2 3 4 5 6 7))
(newline)
(display (same-parity 9 49 3 28 10 11))
