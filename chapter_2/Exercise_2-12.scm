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

(define (make-center-width c w)
    (make-interval (- c w) (+ c w)))

(define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
    (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
    (make-interval (- c (* c (/ p 100.0)) (+ c (* c (/ p 100.0)))

(define (percent i)
    (/ (width i) (center i)))