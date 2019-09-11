(define (simpsons-rule f a b n)
    (define h (/ (- b a) n))
    (define (iter sum counter)
        (if (= counter 0)
            sum
            (if (= (remainder counter 2) 0)
                (iter (+ sum 
                         (* 2 (f (+ a 
                                    (* counter h))))) 
                      (- counter 1))
                (iter (+ sum 
                         (* 4 (f (+ a 
                                    (* counter h))))) 
                      (- counter 1))
            )
        )
    )
    (/ (* h 
          (iter (+ (f a) 
                   (f b)) 
                (- n 1))) 
        3)
)

(define (cube x) (* x x x ))

(simpsons-rule cube 0 1 1000)