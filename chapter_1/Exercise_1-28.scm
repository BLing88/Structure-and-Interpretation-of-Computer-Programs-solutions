; some help from community.schemewiki.org/?sicp-ex-1.28

(define (square n)
    (* n n))

(define (even? x)
    (= (remainder x 2) 0))

(define (expmod base exp m)
    (define (nontrivial-sqrt-one? x)
        (define (sqrt-one? x)
            (if (= x 1)
                0
                x))
        (if (or (= x 1) (= x (- m 1)))
            (remainder (square x)
                        m)
            (sqrt-one? (remainder (square x) m))))

    (cond ((= exp 0) 1)
        ((even? exp)
         (nontrivial-sqrt-one? 
            (expmod base (/ exp 2) m)))
        (else 
          (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
    (define (try-it a)
        (define (check-it x)
            (and (not (= x 0)) (= x 1)))
        (check-it (expmod a (- n 1) n)))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

; (fast-prime?  100) 
 (define (prime? n)  
    ; Perform the test how many times?  
    ; Use 100 as an arbitrary value.  
    (fast-prime? n 100))  
  
 (define (report-prime n expected)  
   (define (report-result n result expected)  
     (newline)  
     (display n)  
     (display ": ")  
     (display result)  
     (display ": ")  
     (display (if (eq? result expected) "OK" "FOOLED")))  
   (report-result n (prime? n) expected))  
    
 (report-prime 2 true)  
 (report-prime 7 true)  
 (report-prime 13 true)  
 (report-prime 15 false) 
 (report-prime 37 true)  
 (report-prime 39 false) 
   
 (report-prime 561 false)  ; Carmichael number  
 (report-prime 1105 false) ; Carmichael number  
 (report-prime 1729 false) ; Carmichael number  
 (report-prime 2465 false) ; Carmichael number  
 (report-prime 2821 false) ; Carmichael number  
 (report-prime 6601 false) ; Carmichael number 
