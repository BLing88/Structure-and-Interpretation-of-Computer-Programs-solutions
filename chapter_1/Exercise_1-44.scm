(define (repeated f n)
    (define (compose f g)
        (lambda (x) (f (g x))))
    (define (repeated-iter g counter)
        (if (= counter 1)
            g
            (repeated-iter (compose g f) (- counter 1))))
    (repeated-iter f n))

(define (smooth f)
    (define (average a b c)
        (/ (+ a b c) 3))
    (let ((dx 0.00001))
        (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx))))))

(define (n-smooth f n)
    ((repeated smooth n) f))

((n-smooth (lambda (x) (* x x)) 1) 1)