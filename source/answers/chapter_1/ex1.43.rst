Exercise 1.43
=====================

:文責: @irration

========
解答
========

線形反復的に記述すると以下のようになる.
イテレーションの初期値, また途中の段階で 手続きそのものを渡し, 最後に lambda式の中で実行される.

.. sourcecode:: scheme 

  (define (repeated f n)
    (define (repeated-iter i result)
      (if (= i n)
        (lambda (x) (result x))
        (repeated-iter (+ i 1) (double result))))
    (repeated-iter 1 f))

=================
実行コード
=================

.. sourcecode:: scheme 

  ((repeated square 2) 5) ; 625