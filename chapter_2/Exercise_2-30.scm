(define (square-tree-direct tree)
    (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree-direct (car tree)) (square-tree-direct (cdr tree))))))

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(newline)
(display (square-tree-direct x))

(define (square-tree-recursive-map tree)
    (map (lambda (sub-tree) 
            (if (pair? sub-tree)
                (square-tree-recursive-map sub-tree)
                (* sub-tree sub-tree)))
          tree))

(newline)
(display (square-tree-recursive-map x))