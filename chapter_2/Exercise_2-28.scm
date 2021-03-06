(define (fringe x)
    (define (append list1 list2)
        (if (null? list1)
            list2
            (cons (car list1) (append (cdr list1) list2))))
    (cond ((null? x) x)
        ((not (pair? x)) (list x))
        (else (append (fringe (car x)) (fringe (cdr x))))))

(define x (list (list 1 2) (list 3 4)))
(newline)
(display (fringe x))
(newline)
(display (fringe (list x x))) 
(newline)
(display (fringe (list x x (list x)))) 
(newline)