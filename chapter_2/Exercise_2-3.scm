(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (make-segment start-point end-point)
    (cons start-point end-point))

(define (start-segment segment)
    (car segment))

(define (end-segment segment)
    (cdr segment))

(define (midpoint-segment segment)
    (define (average x y)
        (/ (+ x y) 2))
    (make-point 
      (average
        (x-point (start-segment segment)) (x-point (end-segment segment)))
      (average
        (y-point (start-segment segment)) (y-point (end-segment segment)))))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ", ")
    (display (y-point p))
    (display ")")) 

(define (segment-length segment)
    (define (dist p1 p2)
    (define (square x)
        (* x x))
    (sqrt 
    (+ 
        (square
        (- (x-point p1) (x-point p2)))
        (square
        (- (y-point p1) (y-point p2))))))
    (dist (x-point segment) (y-point segment)))

;; representation 1: represent rectangles by storing two adjacent sides (represented by segments)
;; store the shorter side in the car
;; constructor make-rect and selectors shorter-side, longer-side
(define (make-rect side-1 side-2)
    (if (> (segment-length side-1) (segment-length side-2))
        (cons side-2 side-1)
        (cons side-1 side-2)))

(define (shorter-side rect)
    (car rect))

(define (longer-side rect)
    (cdr rect))

(define (area rect)
    (* 
      (segment-length (shorter-side rect)) 
      (segment-length (longer-side rect))))

(define (perimeter rect)
    (* 2 
      (+ 
        (segment-length (shorter-side rect)) 
        (segment-length (longer-side rect)))))

(define x (make-rect 
  (make-segment 
    (make-point 0 0)
    (make-point 1 0))
  (make-segment 
    (make-point 1 0)
    (make-point 1 2))))

;; check rotate x by 30 degrees ccw
(define y (make-rect 
  (make-segment 
    (make-point 0 0)
    (make-point (/ (sqrt 3) 2) (/ 1 2)))
  (make-segment 
    (make-point (/ (sqrt 3) 2) (/ 1 2))
    (make-point (/ (- (sqrt 3) 2) 2) (/ (+ 1 (* 2 (sqrt 3))) 2)))))

(newline)
(display "perimeter = ")
(display (perimeter x))
(newline)
(display "area = ")
(display (area x))
(newline)
(display "perimeter = ")
(display (perimeter y))
(newline)
(display "area = ")
(display (area y))

;; representation 2: represent rectangles by storing segments corresponding to the midpoint bisctors
(define (make-rect bisector-1 bisector-2)
    (if (> (segment-length bisector-1) (segment-length bisector-2))
        (cons bisector-2 bisector-1)
        (cons bisector-1 bisector-2)))

(define (shorter-side rect)
    (car rect))

(define (longer-side rect)
    (cdr rect))

(define (area rect)
    (* 
      (segment-length (shorter-side rect)) 
      (segment-length (longer-side rect))))

(define (perimeter rect)
    (* 2 
      (+ 
        (segment-length (shorter-side rect)) 
        (segment-length (longer-side rect)))))

;; check using the same rectangles in terms of their bisectors
(define x (make-rect 
  (make-segment 
    (make-point 0 0.5)
    (make-point 1 0.5))
  (make-segment 
    (make-point 0.5 0)
    (make-point 0.5 2))))

;; check rotate x by 30 degrees ccw
(define y (make-rect 
  (make-segment 
    (make-point (/ -1 4) (/ (sqrt 3) 4))
    (make-point 
      (+ (/ -1 4) (/ (sqrt 3) 2)) 
      (+ (/ 1 2) (/ (sqrt 3) 4))))
  (make-segment 
    (make-point (/ (sqrt 3) 4) (/ 1 4))
    (make-point (- (/ (sqrt 3) 4) 1) (+ (sqrt 3) (/ 1 4))))))

(newline)
(display "perimeter = ")
(display (perimeter x))
(newline)
(display "area = ")
(display (area x))
(newline)
(display "perimeter = ")
(display (perimeter y))
(newline)
(display "area = ")
(display (area y))