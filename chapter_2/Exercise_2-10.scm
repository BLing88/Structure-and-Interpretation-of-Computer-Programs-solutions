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

(define (div-interval x y)
    (define (spans-zero? x)
        (let ((a (lower-bound x))
              (b (upper-bound x)))
            (cond ((and (< a 0) (> b 0)) true)
                ((= a 0) true)
                ((= b 0) true)
                (else false))))
    (if (spans-zero? y)
        (error "divide by zero error")
        (mul-interval x
                      (make-interval (/ 1.0 (upper-bound y))
                                     (/ 1.0 (lower-bound y))))))

(define x (div-interval (make-interval 1 2) (make-interval 2 4)))
(newline)
(display (lower-bound x))
(newline)
(display (upper-bound x))

(define y (div-interval (make-interval 1 2) (make-interval -2 4)))

