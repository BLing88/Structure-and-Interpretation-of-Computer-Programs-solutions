(define (make-account balance password)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                   balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
    (define (call-the-cops)
        "Call the cops")
    (define times-called-incorrectly 0)
    (define (incorrect-password x)
            (set! times-called-incorrectly 
                         (+ times-called-incorrectly 1))
                    (if (> times-called-incorrectly 1) 
                        (call-the-cops)
                        "Incorrect password"))
    (define (dispatch p m)
        (cond ((not (eq? p password)) incorrect-password)
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m))))
    dispatch)

(define acc (make-account 100 'secret-password))
(newline)
(display ((acc 'secret-password 'withdraw) 40)) ; 60
(newline)
(display ((acc 'some-other-password 'deposit) 50))  ; "Incorrect password"
(newline)
(display ((acc 'secret-password 'withdraw) 40))  ; "20"
(newline)
(display ((acc 'some-other-password 'deposit) 50))  ; "Call the cops"
(newline)
(display ((acc 'some-other-password 'withdraw) 50))  ; "Call the cops"