(define (square n)
    (* n n))

(define (next x)
    (if (= x 2)
        3
        (+ x 2)))

(define (smallest-divisor n)
    (define (find-divisor n test-divisor)
        (define (divides? a b)
            (= (remainder b a) 0))
        (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (next test-divisor)))))
    (find-divisor n 2))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (timed-prime-test n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
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



 (search-for-primes 1000000000000 2000000000021 3)       ; 1e9 
 (search-for-primes 10000000000000 20000000000061 3)     ; 1e10 
 (search-for-primes 100000000000000 100000000000557 3)   ; 1e11 
 (search-for-primes 1000000000000000 1000000000000563 3) ; 1e12 

; Comparing to exercise 1.22, the observed ratio of the speeds of the two algorithms is roughly 1.66, this is from the next procedure
; requiring an extra if test