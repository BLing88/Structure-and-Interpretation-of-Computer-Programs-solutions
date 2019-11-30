;; we can define element-of-set? to be the same as before with the same efficiency, since it just goes down the list
;; and returns true at the first instance of x, or false otherwise
(define (element-of-set? x set)
    (cond ((null? set) false)
      ((equal? x (car set)) true)
      (else (element-of-set? x (cdr set)))))

;; could use the same adjoin-set procedure as before, or could just return (cons x set) regardless
;; of whether or not x is in set. That would be more efficient since you don't have to check if x is in
;; set
(define (adjoin-set x set)
    (if (element-of-set? x set)
        set
        (cons x set)))

;; in this representation, you can just combine the two lists. this is more efficient since you don't have to do
;; any checking for duplicates
(define (union-set set1 set2)
    (append set1 set2))


;; we define intersection-set to be the same as before, but it is less efficient  
;; because you have to check if every element of set1 is in set2, and there might be duplicates in set1
(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
          (cons (car set1) 
                (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

