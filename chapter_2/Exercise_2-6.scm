(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add m n)
    (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(define (test x)
    (newline)
    (display x)
    x)

(((add one two) test) "hi") 

