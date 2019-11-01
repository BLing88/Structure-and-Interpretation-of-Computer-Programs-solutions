(define (filter predicate sequence)
    (cond ((null? sequence) '())
        ((predicate (car sequence)) 
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

(define (remove item sequence)
    (filter (lambda (x) (not (= x item)))
            sequence))

(define (permutations s)
    (if (null? s)
        (list '())
        (flatmap (lambda (x) 
                         (map (lambda (p) (cons x p))
                              (permutations (remove x s))))
                 s)))


(define (triples s)
    (flatmap permutations ;; permute each triple
            (flatmap (lambda (k) ;; generate all triples (k, i, j) that add to s
                        (map (lambda (pair) (cons k pair)) 
                            (filter (lambda (pair) (= (- s k) (+ (car pair) (cadr pair)))) ;; filter out pairs that don't add to s-k
                                    (unique-pairs (- k 1))))) ;; generate all pairs (i, j), 1<=j < i , k-1
                (enumerate-interval 3 (- s 3)))))

(newline)
(display (triples 6)) ;; should be all permutations of (1 2 3)
(newline)
(display (triples 8))