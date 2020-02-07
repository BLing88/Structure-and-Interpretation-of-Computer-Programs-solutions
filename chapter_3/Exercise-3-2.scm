(define (make-monitored f)
    (let ((times 0))
      (lambda (x) 
        (if (eq? x 'how-many-calls?)
          times
          (begin 
            (set! times (+ times 1))
            (f x))))))


(define square (lambda (x) (* x x)))
(define s (make-monitored square))

(newline)
(display (s 'how-many-calls?)) ;; 0
(newline)
(display (s 10)) ;; 100
(newline)
(display (s 'how-many-calls?)) ;; 1
