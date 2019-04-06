(define (fast-mult a b)
    (define (double a)
        (+ a a))
    (define (halve a)
        (/ a 2))
    (define (is-odd? a)
        (if (= (modulo a 2) 1) 
            #t
            #f))
    
    (define (mult-iter sum a b)
        (cond ((= b 0) sum)
              ((is-odd? b) (mult-iter (+ sum a) a (- b 1)))
              (else (mult-iter sum (double a) (halve b)))))
    (mult-iter 0 a b)
)

(fast-mult 20 21)