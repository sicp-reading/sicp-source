Exercise 2.1
=====================

:文責: @naoiwata

========
解答
========

有理数が正なら分子, 分母とも正, 有理数が負なら分子だけ負としたい.
有理数の分母が負の場合のみ, 分母分子に -1 を掛けることで分子分母の正負を反転させる.

.. sourcecode:: scheme 

   (define (make-rat n d)
     (let 
       ((g (gcd n d))
        (s (if (< d 0) -1 1)))
       (cons (* s (/ n g)) (* s (/ d g)))))

=================
実行コード
=================

.. sourcecode:: scheme 

   (define (make-rat n d)
     (let 
       ((g (gcd n d))
        (s (if (< d 0) -1 1)))
       (cons (* s (/ n g)) (* s (/ d g)))))

   (define (numer x)
     (car x))

   (define (denom x)
     (cdr x))

   ;; テスト
   (define (print-rat x)
     (newline)
     (display (numer x))
     (display "/")
     (display (denom x)))

   (print-rat (make-rat 3 5))
   ;; g = 1, s = 1 より
   ;; => (cons (* 1 (/ 3 1)) (* 1 (/ 5 1)))
   ;; =>  3/5

   (print-rat (make-rat -3 5))
   ;; g = 1, s = 1 より
   ;; => (cons (* 1 (/ -3 1)) (* 1 (/ 5 1)))
   ;; => -3/5

   (print-rat (make-rat 3 -5))
   ;; g = 1, s = -1 より
   ;; => (cons (* -1 (/ 3 1)) (* -1 (/ -5 1)))
   ;; => -3/5

   (print-rat (make-rat -3 -5))
   ;; g = 1, s = -1 より
   ;; => (cons (* -1 (/ -3 1)) (* -1 (/ -5 1)))
   ;; =>  3/5
