; a) p is applied 5 times to 0.05 to approximate sin(12.15)

; b) Suppose we need to apply p n times, i.e. we need to divide a by 3 n times.
; For a tolerance of 1/b (so b = 10 for a tolerance of 0.1 rad),
; we see that in applying p n times to approximate sin(a) means applying p to a / 3^n once a / 3^ n < 1/b
; we require n = ceiling(log(3, b * a)) i.e. ceiling of the log base 3 of b*a. 
; Thus only a logarithmic number of steps is necessary, and since we need only do deferred nested calls to p,
; the space required is also logarithmic in a.