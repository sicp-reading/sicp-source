Exercise 1.40
=====================

:文責: @irration

========
解答
========

.. sourcecode:: scheme 

  (define (cube x) (* x x x))
  (define (square x) (* x x))

  (define (cubic a b c)
    (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

=================
実行コード
=================

.. sourcecode:: scheme 

  (newtons-method (cubic 3 2 5) 1) ;; => -2.9041608591349113

実際にこの値が正しいことを以下のリンクで確認してみる.
`x^3+2x^2+5x+1の実際の計算結果 <http://www.wolframalpha.com/input/?i=x%5E3%2B3x%5E2%2B2x%2B5%3D0&dataset=>`_ 