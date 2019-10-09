(define (nth-root n x)
    (define (fixed-point f first-guess)
        (define tolerance 0.00001)
        (define (close-enough? v1 v2)
            (< (abs (- v1 v2)) tolerance))
        (define (try guess)
            (let ((next (f guess)))
                (if (close-enough? guess next)
                    next
                    (try next))))
        (try first-guess))

    (define (repeated f n)
        (define (compose f g)
            (lambda (x) (f (g x))))
        (define (repeated-iter g counter)
            (if (= counter 1)
                g
                (repeated-iter (compose g f) (- counter 1))))
        (repeated-iter f n))

    (define (average-damp f)
        (define (average x y) (/ (+ x y) 2))
        (lambda (x) (average x (f x))))

    (let ((times-damp (if (< n 3) 1 (- n 2))))
         (fixed-point ((repeated average-damp times-damp) 
                    (lambda (y) (/ x (expt y (- n 1)))))
                 1.0))
   )

(nth-root 7 32)  ;returns 1.6406989