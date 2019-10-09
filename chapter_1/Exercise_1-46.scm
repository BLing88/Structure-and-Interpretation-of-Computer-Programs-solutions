(define (iterative-improve good-enough? improve-guess)
    (define (improve-iter guess)
        (if (good-enough? guess)
            guess
            (improve-iter (improve-guess guess))))
    improve-iter)

(define (sqrt x)
    (define (square x)
        (* x x))
    (define (average x y)
        (/ (+ x y) 2))
    (define tolerance 0.000001)
    ((iterative-improve
        (lambda (guess) (< (abs (- (square guess) x)) tolerance))
        (lambda (guess) (average guess (/ x guess))))
      1.0))

(define (fixed-point f first-guess)
    (define tolerance 0.000001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))


(define (fixed-point f first-guess)
    (define tolerance 0.000001)
    (define (close-enough? guess)
        (< (abs (- guess (f guess))) tolerance))
    (define (improve-guess guess)
        (f guess))
    ((iterative-improve close-enough? improve-guess) first-guess))

; (sqrt 9)
(fixed-point cos 1.0) ; returns 0.7390845
