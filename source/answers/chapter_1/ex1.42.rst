Exercise 1.42
=====================

:文責: @irration

========
解答
========

.. sourcecode:: scheme 

  (define (composition f g)
    (lambda (x) (f (g x))))

=================
実行コード
=================

.. sourcecode:: scheme 

  ((compose square inc) 6) ;; => 49