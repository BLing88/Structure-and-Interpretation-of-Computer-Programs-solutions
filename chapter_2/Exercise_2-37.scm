(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        '()
        (cons (accumulate op init (map car seqs))
              (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map (lambda (row) (dot-product row v)) m))

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define v (list 10 11 12 13))
; (newline)
; (display (matrix-*-vector m v))

(define (transpose m)
    (accumulate-n (lambda (x y) (cons x y)) '() m))

; (newline)
; (display (transpose m))

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (m-row) (accumulate 
                            (lambda (col previous-entry) (cons (dot-product m-row col) previous-entry)) 
                            '() 
                            cols)) 
              m)))

(newline)
(display (matrix-*-matrix m (transpose m))) ;; ((30 56 80) (56 113 161) (80 161 230))