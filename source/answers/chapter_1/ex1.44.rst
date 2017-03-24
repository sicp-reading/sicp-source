Exercise 1.44
=====================

:文責: @irration

========
解答
========

Exercise 1.43 の repeated では square関数に 5という数値が引数として渡ったが, 今回は cube という手続きを引数として渡している点に注目.
表現の広さに最初は若干混乱するが, 「引数」を渡しているという観点で考えると理解しやすい.

.. sourcecode:: scheme 

  (define dx 0.000001)

  (define (cube x) (* x x x))

  (define (double f)
    (lambda (x) (f (f x))))
  
  (define (repeated f n)
    (define (repeated-iter i result)
      (if (= i n)
        (lambda (x) (result x))
        (repeated-iter (+ i 1) (double result))))
    (repeated-iter 1 f))
  
  (define dx 0.000001)
  
  (define (smooth f)
    (lambda (x) (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3)))

  ((smooth cube) 3)

  (define (n-fold-smooth n f)
    ((repeated smooth n) f))

=================
実行コード
=================

.. sourcecode:: scheme 

  ((n-fold-smooth 5 cube) 3) ;; => 27.000000000006