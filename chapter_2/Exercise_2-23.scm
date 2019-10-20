(define (for-each func items)
    (define (func-iter items arbitrary)
        (if (null? items)
            true
            (func-iter (cdr items) (func (car items)))))
    (func-iter items true))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))