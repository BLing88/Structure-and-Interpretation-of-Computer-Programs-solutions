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
; (display (total-weight y))  ;; returns 25

(define (is-balanced? mobile)
    (define (torque branch)
        (* (branch-length branch) (total-weight (branch-structure branch))))
    (define (left-right-balanced? mobile-level)
        (= (torque (right-branch mobile-level)) (torque (left-branch mobile-level))))
    (define (is-not-mobile? x)
        (not (pair? x)))
    (cond ((is-not-mobile? mobile) true)
        ((left-right-balanced? mobile)
            (and (is-balanced? (branch-structure (right-branch mobile))) 
                (is-balanced? (branch-structure (left-branch mobile)))))
        (else false))
    )

(define z (make-mobile (make-branch 3 4) (make-branch 2 6)))
(define w (make-mobile (make-branch 1 y) (make-branch 2 x)))
(define u (make-mobile (make-branch 2 z) (make-branch 4 5)))
(display (is-balanced? u))


;; if we change the representation of mobiles to the following:
; (define (make-mobile left right)
;     (cons left right))

; (define (make-branch length structure)
;     (cons length structure))

;; then the only things that need to change above are the selectors right-branch, and branch-structure