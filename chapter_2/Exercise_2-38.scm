(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                  (cdr rest))))
    (iter initial sequence))

(newline)
(display (fold-right / 1 (list 1 2 3))) ; 3/2
(newline)
(display (fold-left / 1 (list 1 2 3))) ; 1/6
(newline)
(display (fold-right list '() (list 1 2 3))) ; (1 (2 (3)))
(newline)
(display (fold-left list '() (list 1 2 3))) ; (3 (2 (1)))

;; op should be symmetric in its arguments: op(x,y) gives the same result as op(y,x)