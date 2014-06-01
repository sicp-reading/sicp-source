Exercise 1.22
=====================

:文責: @iriya_ufo

.. sourcecode:: scheme

   (use srfi-19)

   (define (smallest-divisor n)
     (find-divisor n 2))

   (define (find-divisor n test-divisor)
     (cond ((> (square test-divisor) n) n)
           ((divides? test-divisor n) test-divisor)
           (else (find-divisor n (+ test-divisor 1)))))

   (define (square x) (* x x))

   (define (divides? a b)
     (= (remainder b a) 0))

   (define (prime? n)
     (= n (smallest-divisor n)))

   (define (timed-prime-test n)
     (newline)
     (display n)
     (start-prime-test n (current-time)))

   (define (start-prime-test n start-time)
     (and (prime? n)
          (report-prime (time-difference (current-time) start-time))))

   (define (report-prime elapsed-time)
     (display " *** ")
     (display elapsed-time))

   (define (search-for-primes from n)
     (cond ((= n 0) (newline) 'done)
           ((even? from) (search-for-primes (+ from 1) n))
           ((timed-prime-test from) (search-for-primes (+ from 2) (- n 1)))
           (else (search-for-primes (+ from 2) n))))

   (define (search n)
     (display (search-for-primes n 3))
     (newline))

   (search 1000)     ;; => #<time-duration 0.000020000>
   (search 10000)    ;; => #<time-duration 0.000063000>
   (search 100000)   ;; => #<time-duration 0.000167000>
   (search 1000000)  ;; => #<time-duration 0.000501000>

search の結果より, 引数の桁が10倍になるごとに実行結果経過時間は :math:`\sqrt 10` 倍程度になっている.
よってプログラムはステップ数に比例した時間で走ると予想できる.
