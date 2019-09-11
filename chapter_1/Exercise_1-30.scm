(define (sum term a next b)
    (define (iter a result)
        (if (= a b)
            result
            (iter (next a)
                  (+ result (term (next a))))))
    (iter a (term a))
)

(define (inc n) (+ n 1))
(define (cube x) (* x x x ))

(sum cube 1 inc 10)