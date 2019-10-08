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
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (timed-prime-test n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (fast-prime? n 5)
        (and (report-prime n (- (runtime) start-time)) #t)
        #f))

(define (report-prime n elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time))

(define (search-for-primes start end number-primes)
    (define (prime-search-iter n counter)
        (cond ((or (> n end) (= counter number-primes)) (and (newline) (display "finished search")))
            ((= (remainder n 2) 0) (prime-search-iter (+ n 1) counter))
            ((timed-prime-test n) (prime-search-iter (+ n 2) (+ counter 1)))
            (else (prime-search-iter (+ n 2) counter))))
    (prime-search-iter start 0))



;  (search-for-primes 1000000000000 2000000000021 3)      
;  (search-for-primes 10000000000000 20000000000061 3)     
;  (search-for-primes 100000000000000 100000000000557 3)
 (search-for-primes 1000000000000000000000000000 1000000000000000000000000563 3) 

; Comparing to exercise 1.22, the observed ratio of the speeds of the two algorithms is roughly 1.66, this is from the next procedure
; requiring an extra if test