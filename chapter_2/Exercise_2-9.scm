;; Let x and y be intervals, and let Lx, Ly be their lower bounds, and Ux, Uy be their upper bounds.
;; The widths Wx and Wy are then Wx = (Ux - Lx)/2, Wy = (Uy - Ly)/2.
;; L(x+y) = Lx + Ly, and U(x+y) = Ux + Uy, so W(x+y) = (U(x+y) - L(x+y))/2 = ((Ux-Lx)/2 + (Uy-Ly)/2) = Wx + Wy
;; which is a linear function in the widths of the intervals x and y

;; L(x-y) = Lx - Uy, U(x-y) = Ux - Ly, so W(x-y) = ((Ux - Ly) - (Lx - Uy))/2 = ((Ux - Lx)/2 + (Uy - Ly)/2) = Wx + Wy
;; which is the same linear function in Wx and Wy as for addition of intervals

(define (make-interval a b)
    (cons a b))

(define (upper-bound interval)
    (let ((a (car interval))
          (b (cdr interval)))
        (max a b)))

(define (lower-bound interval)
    (let ((a (car interval))
          (b (cdr interval)))
        (min a b)))
        
(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
        (make-interval (max p1 p2 p3 p4) (min p1 p2 p3 p4))))

(define (width-interval x)
    (/ (- (upper-bound x) (lower-bound x)) 2))

;; if the width of the product of two intervals depennded on only the widths of the intervals being multiplied,
;; then multiplying two sets of intervals with the same widths should yield intervals with the same width
(newline)
(display (width-interval (mul-interval (make-interval (/ 1 2) 1) (make-interval -1 4)))) ;; returns 5/2
(newline)
(display (width-interval (mul-interval (make-interval (/ -1 2) -1) (make-interval 1 6)))) ;; returns 11/4