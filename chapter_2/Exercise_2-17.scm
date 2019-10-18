(define (last-pair x)
    (if (null? (cdr x))
        x
        (last-pair (cdr x))))

(newline) 
(display (last-pair (list 1 2 3 4 5 6 8)))