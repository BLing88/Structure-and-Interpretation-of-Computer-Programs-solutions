(define (square x)
    (* x x))

(define (square-list-1 items)
    (if (null? items)
        '()
        (cons 
          (square (car items))
          (square-list-1 (cdr items)))))

(newline)
(display (square-list-1 (list 1 2 3 4)))

(define (square-list-2 items)
    (map square items))

(newline)
(display (square-list-2 (list 4 5 6 7)))