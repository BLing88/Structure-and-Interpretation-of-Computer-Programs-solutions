(define (pascals_triangle n m)
    (cond ((= m 1) 1)
          ((= m n) 1)
          (else (+ (pascals_triangle (- n 1) (- m 1)) 
                   (pascals_triangle (- n 1) m)))))

(pascals_triangle 5 4)