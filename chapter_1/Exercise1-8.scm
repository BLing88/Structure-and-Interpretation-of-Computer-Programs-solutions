(define (cubeRt x)
  (define (improve guess x)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
  (define (cube x)
    (* x x x))
  (define (good-enough? guess x)
    (< (abs (/ (- x (cube guess)) x) ) 0.001)) ; Use percent tolerance
  (define (cubrt-iter guess x)
    (if (good-enough? guess x)
      guess
      (cubrt-iter (improve guess x)
		  x)))
  (cubrt-iter 1.0 x)
  )

;(cubeRt 8) ; returns 2.000004911675504 with 0.1% tolerance
;(cubeRt 27)
