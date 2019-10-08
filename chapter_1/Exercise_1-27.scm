(define (square n)
    (* n n))

(define (even? x)
    (= (remainder x 2) 0))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else 
          (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
    (define (try-it a)
        (newline)
        (display a)
        (if (>= a n)
            #t
            (if (= (expmod a n n) a)
                (try-it (+ a 1))
                #f))
    )
    (try-it 2))

(fermat-test 1105)
