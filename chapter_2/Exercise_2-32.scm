(define (subsets s)
    (if (null? s)
        (list '())
        (let ((rest (subsets (cdr s))))
            (append rest (map (lambda (subset) (cons (car s) subset)) rest)))))

;;  Take the union of the power set P of the set minus the first element with the same power set P 
;; but with the first element added back into each subset

(newline)
(display (subsets (list 1 2 3 4)))