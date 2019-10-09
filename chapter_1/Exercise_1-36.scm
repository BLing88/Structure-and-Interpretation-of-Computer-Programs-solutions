;;  using the fact that phi^2 = phi + 1, we have that 1 + 1/phi = (phi + 1) / phi = phi^2 / phi.

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (newline)
        (display guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (average x y)
    (/ (+ x y) 2))

(fixed-point (lambda (y) (/ (log 1000) (log y))) 10)  ; roughly 30 something steps without average damping
(fixed-point (lambda (y) (average y (/ (log 1000) (log y)))) 10) ; 10 steps with average damping