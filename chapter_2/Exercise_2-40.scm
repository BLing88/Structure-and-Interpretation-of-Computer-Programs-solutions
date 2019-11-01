(define (filter predicate sequence)
    (cond ((null? sequence) '())
        ((predicate (car sequennce)) 
          (cons (car sequence)
                (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (flatmap proc seq)
    (fold-right append '() (map proc seq)))

(define (enumerate-interval low high)
    (if (> low high)
        '()
        (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
    (flatmap (lambda (i) 
                      (map (lambda (j) (list i j))
                           (enumerate-interval 1 (- i 1))))
              (enumerate-interval 1 n)))

(newline)
(display (unique-pairs 4))

(define (prime-sum-pairs n)
    (map make-pair-sum
         (filter prime-sum? (unique-pairs n))))