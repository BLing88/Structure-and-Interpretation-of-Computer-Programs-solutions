;;  using the fact that phi^2 = phi + 1, we have that 1 + 1/phi = (phi + 1) / phi = phi^2 / phi.

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (f x)
    (+ 1 (/ 1 x)))

(fixed-point f 1) ; returns 987/610 = 1.6180327