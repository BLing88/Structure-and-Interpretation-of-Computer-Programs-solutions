; Exercise 1.7
; If we're dealing with numbers larger than the precision of the computer, then
					; squaring will lead to truncation.
; With very small numbers, the difference between very small numbers will be close to the tolerance used in the good-enough? test, leading to poor approximations

;; (define (sqrt x)
;;   (define (average x y)
;;     (/ (+ x y) 2))
;;   (define (improve guess x)
;;     (average guess (/ x guess)))
;;   (define (square x)
;;     (* x x))
;;   (define (good-enough? guess x)
;;     (< (abs (- (square guess) x)) 0.001))
;;   (define (sqrt-iter guess x)
;;     (if (good-enough? guess x)
;; 	guess
;; 	(sqrt-iter (improve guess x)
;; 		   x)))
;;   (sqrt-iter 1.0 x))

;(sqrt .0004) gives .0354008825558513 whereas the correct answer is .02
;(sqrt 875938483038943013049100134034900000000000000)

(define (sqrt2 x)
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (square x)
    (* x x))
  (define (good-enough? guess x)
    (< (abs (/ (- x (square guess)) x)) 0.00001))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x)
		   x)))
  (sqrt-iter 1.0 x))

; (sqrt2 .0004) gives 2.0000000050877154e-2 with 0.001% tolerance
; this new sqrt works better for smaller numbers since we don't worry about the absolute tolerance
