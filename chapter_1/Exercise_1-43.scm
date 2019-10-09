(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated f n)
    (define (compose f g)
        (lambda (x) (f (g x))))
    (define (repeated-iter g counter)
        (if (= counter 1)
            g
            (repeated-iter (compose g f) (- counter 1))))
    (repeated-iter f n))

(define (square x)
    (* x x))

(define (inc x)
    (+ x 1))

((repeated square 2) 5)
((repeated inc 10) 0)
