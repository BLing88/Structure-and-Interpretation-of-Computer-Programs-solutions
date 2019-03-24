(define (pascals_triangle n m)
    ;;;
    ; returns the m-th element corresponding to the n-th row of Pascal's triangle
    ; param n: integer > 0
    ; param m: 0 < integer  <= n
    ; return: integer
    ;;;

    (cond ((= m 1) 1)
          ((= m n) 1)
          (else (+ (pascals_triangle (- n 1) (- m 1)) 
                   (pascals_triangle (- n 1) m)))))

(pascals_triangle 5 4)