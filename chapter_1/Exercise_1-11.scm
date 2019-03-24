; Recursive definition of f:
(define (f n)
    (if (< n 3)
        n
        (+ (f (- n 1))
        (* 2 (f (- n 2)))
        (* 3 (f (- n 3))))))

; (f 3)

; Iterative definition of f:
; start with a = 2, b = 1, c = 0, apply the transformation
; a <- a + 2b + 3c
; b <- a
; c <- b
; applying this transformation n times, a will have the value f(n+2), b = f(n+1), and c = f(n)
(define (g n)
    (define (g-iter a b c count)
        (if (= count 0)
            c
            (g-iter (+ a 
                       (* 2 b) 
                       (* 3 c))
                     a b (- count 1))))
    (g-iter 2 1 0 n))

(g 3)
