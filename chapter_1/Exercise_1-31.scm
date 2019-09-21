;; part a
(define (product current-term a compute-next-index b)
    (define (product-iter next-index result)
        (if (= next-index b)
            result
            (product-iter 
                (compute-next-index next-index)
                (* result 
                   (current-term (compute-next-index next-index))))))
    (product-iter 
        a
        (current-term a)))

(define (add-one a)
    (+ a 1))

(define (identity a)
    a)

(define (factorial n)
    (product identity 1 add-one n))

; (factorial 4)

(define (pi-approx num-terms)
    (define (square x)
        (* x x))
    (define (term i)
        (/ (* 
             (* 2 i) 
             (+ (* 2 i) 2))
           (square (+ (* 2 i) 1))))
    (* 4 (product term 1 add-one num-terms)))

; (pi-approx 100)
; (factorial 7)

(define (product-recursive term a compute-next-index b)
    (if (> a b)
        1
        (* (term a)
           (product-recursive term (compute-next-index a) compute-next-index b))))

(define (factorial-recursive n)
    (product-recursive identity 1 add-one n))

(define (pi-approx-recursive num-terms)
    (define (square x)
        (* x x))
    (define (term i)
        (/ (* 
             (* 2 i) 
             (+ (* 2 i) 2))
           (square (+ (* 2 i) 1))))
    (* 4 (product-recursive term 1 add-one num-terms)))

; (factorial-recursive 7)
(pi-approx-recursive 10)