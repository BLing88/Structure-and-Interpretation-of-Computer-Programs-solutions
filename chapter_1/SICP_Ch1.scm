; run in terminal (load "Scheme/SICP_Ch1.scm")

; Exercise 1.2
;(/ (+ 5
;      (+ 4
;	 (- 2
;	    (- 3
;	       (+ 6
;		  (/ 4 5)
;		  )
;	       )
;	    )
;	 )
;     )
;      (* 3
;	 (- 6 2)
;;	 (- 2 7)))

;; Exercise 1.3
;; (define (sumOfLargestSquares a b c)
;;   (define (max x y)
;;     (cond ((> x y) x)
;; 	  (else y))
;;     )
;;   (define largest (max (max a b)
;; 		       c))
;;   (define secondLargest (cond ((= largest a) (max b c))
;; 				((= largest b) (max a c))
;; 				(else (max a b))))
;;   (define (square x) (* x x))

;;   (+ (square largest)
;;      (square secondLargest))      
;; )

;; (sumOfLargestSquares 2 3 4)


;; Exercise 1.4
;; (define (a-plus-abs-b a b)
;;   ((if (> b 0) + -) a b))
;; this returns a + abs(b)


;; Exercise 1.6
;;(define (square x) (* x x))	       	

;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.001))

;; (define (average x y)
;;   (/ (+ x y) 2))

;; (define (improve guess x)
;;   (average guess (/ x guess)))

;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x)
;; 		 x)))

;; (define (new-if predicate then-clause else-clause)
;;   (cond (predicate then-clause)
;; 	(else else-clause)))

;; (define (sqrt-iter-2 guess x)
;;   (new-if (good-enough? guess x)
;;       guess
;;       (sqrt-iter-2 (improve guess x)
;; 		 x)))

;; (define (sqrt x)
;;   (sqrt-iter-2 1.0 x))

;; (sqrt 9)

;; new-if does not use normal order evaluation, it uses applicative order evaluation. That is, the interpreter first evaluates the operator and operands and then applies the resulting procedure to the resulting arguments. As with Excercise 1.5, this results in an infinite recursion because the else-clause is always evaluated, thus calling the procedure again ad infinitum.

;; The if statement is a special form and behaves differently. if first evalutes the predictate, and then evaluates either the consequent (if the predicate evalutes to #t) or the alternative (if the predicate evalues to #f). This is key difference from new-if -- only one of the two consequent expressions get evaluated when using if, while both of the consequent expressions get evaluated with new-if. 
