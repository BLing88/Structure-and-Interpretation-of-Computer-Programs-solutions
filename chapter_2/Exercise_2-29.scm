(define (make-mobile left right)
    (list left right))

(define (make-branch len structure)
    (list len structure))

(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile)
    (cadr mobile))
    
(define (branch-length branch)
    (car branch))

(define (branch-structure branch)
    (cadr branch))

(define (total-weight mobile)
    (define (is-not-mobile? x)
        (not (pair? x)))
    (if (is-not-mobile? mobile)
        mobile
        (+ (total-weight (branch-structure (right-branch mobile)))
           (total-weight (branch-structure (left-branch mobile))))))

(define x (make-mobile (make-branch 2 5) (make-branch 3 11)))
(define y (make-mobile (make-branch 4 9) (make-branch 7 x)))
(newline)
(display (total-weight y))