(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (square x)
    (* x x))

(newline)
(display (map square (list 1 2 3 4)))

(define (append seq1 seq2)
    (accumulate cons seq2 seq1))

(newline)
(display (append (list 1 2 3 4) (list "a" "b" "c" "d")))

(define (length sequence)
    (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(newline)
(display (length (list 1 2 3 4 5)))
(newline)
(display (length (list 1 3 "d" 4 5 0 3 9)))