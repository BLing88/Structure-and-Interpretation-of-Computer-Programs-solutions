(define (filtered-accumulate combiner null-value term a next b filter)
    (define (accumulate-iter accumulation current-term)
        (if (> current-term b)
            (combiner accumulation (term null-value))
            (if (filter current-term)
                (accumulate-iter 
                    (combiner accumulation (term current-term))
                    (next current-term))
                (accumulate-iter 
                    accumulation
                    (next current-term)))
            ))
    (if (filter a)
        (accumulate-iter (term a) (next a))
        (filtered-accumulate combiner null-value term (next a) next b filter))
)

(define (is-even? x)
    (= 0 (remainder x 2)))

(define (add a b)
    (+ a b))

(define (add-one a)
    (+ a 1))

(define (cube x)
    (* x x x ))

(define (sum a b f)
    (accumulate add 0 f a add-one b))

; (filtered-accumulate add 0 cube 1 add-one 14 is-even?)
; (is-even? 1)

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

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (relatively-prime-to-n? n)
    (define (relatively-prime? i)
        (= (gcd n i) 1))
    relatively-prime?)

(define (product a b)
    (* a b))

(define (identity x)
    x)


; (filtered-accumulate add 0 square 2 add-one 23 prime?)  ; 1556
(filtered-accumulate product 1 identity 1 add-one 11 (relatively-prime-to-n? 11))  ; 3628800