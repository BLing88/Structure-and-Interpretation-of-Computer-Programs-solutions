; p' = p^2 + q^2, q' = q^2 + 2pq
(define (fib n)
    (define (even? n)
        (= (remainder n 2) 0))
    (define (fib-iter a b p q count)
      (cond ((= count 0) b)
          ((even? count) 
           (fib-iter a
                     b
                     (+ (* p p)
                        (* q q))
                     (+ (* q q)
                        (* 2 p q))
                     (/ count 2)))
            (else (fib-iter (+ (* b q) (* a q) (* a p))
                            (+ (* b p) (* a q))
                            p
                            q
                            (- count 1)))))
    (fib-iter 1 0 0 1 n))

(fib 19)