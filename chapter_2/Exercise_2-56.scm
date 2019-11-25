(define (deriv exp var)
    (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp) 
          (make-sum 
            (make-product (multiplier exp)
                          (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var)
                          (multiplicand exp))))
        ((exponentiation? exp) 
            (make-product
                (make-product 
                    (exponent exp) 
                    (make-exponentiation (base exp) (- (exponent exp) 1)))
                (deriv (base exp) var)))
        (else 
          (error "unknown expression type: DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2)
    (list '* m1 m2))

(define (sum? x)
    (and (pair? x) (eq? (car x) '+)))

(define (addend s)
    (cadr s))

(define (augend s)
    (caddr s))

(define (product? x)
    (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
    (cadr p))

(define (multiplicand p)
    (caddr p))

(define (exponentiation? x)
    (and (pair? x) (eq? (car x) '**)))

(define (base x)
    (cadr x))

(define (exponent x)
    (caddr x))

(define (make-exponentiation b n)
    (cond ((= n 0) 1)
        ((= n 1) b)
        (else (list '** b n))))

(newline)
(display (deriv '(+ x 3) 'x))
(newline)
(display (deriv '(* x y) 'x))
(newline)
(display (deriv '(* (* x y) (+ x 3)) 'x))
(newline)
(display (deriv '(** x 4) 'x))
