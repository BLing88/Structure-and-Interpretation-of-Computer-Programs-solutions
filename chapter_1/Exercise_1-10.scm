(define (A x y)
    (cond ((= y 0) 0)
    ((= x 0) (* 2 y))
    ((= y 1) 2)
    (else (A (- x 1)
             (A x (- y 1))))))

; (A 1 10)
; (A 0 (A 1 9))
; (* 2 (A 1 9))
; (* 2 (A 0 (A 1 8)))
; (* 2 (* 2 (A 1 8)))
; ...
; returns 2^10 = 1024

; (A 2 4) returns 65536
; (A 0 n) returns 2n
; (A 1 n) returns 2^n
; (A 2 n) = (A 1 (A 2 (- n 1)))
;         returns 2 ^ (A 2 (- n 1))
; and since (A 2 1) returns 2,
; we see that (A 2 n) is simply a repeated exponential of with base 2:
; (A 2 4) returns 2^2^2^2 = 65536