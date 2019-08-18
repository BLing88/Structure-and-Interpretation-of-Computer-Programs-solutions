(define (square n)
    (* n n))

(define (smallest-divisor n)
    (define (find-divisor n test-divisor)
        (define (divides? a b)
            (= (remainder b a) 0))
        (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (find-divisor n 2))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
    (display "***")
    (display elapsed-time))

; (timed-prime-test 333334373)
; (prime? 333334373)

(define (search-for-primes start end number-of-primes)
    (define (prime-search-iter n counter)
        (cond ((prime? n) (timed-prime-test n)))
        (if (or (= counter number-of-primes) (> n end))
            "finished"
            (if (prime? n)
                (prime-search-iter (+ n 1) (+ counter 1))
                (prime-search-iter (+ n 1) counter))))
    (prime-search-iter start 0))

 (search-for-primes 1000000000000 200000000021 3)       ; 1e9 
 (search-for-primes 10000000000000 20000000000061 3)     ; 1e10 
 (search-for-primes 100000000000000 100000000000057 3)   ; 1e11 
 (search-for-primes 1000000000000000 1000000000000063 3) ; 1e12 
