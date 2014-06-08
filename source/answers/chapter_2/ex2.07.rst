Exercise 2.07
=====================

:文責: @irration

========
解答
========

.. sourcecode:: scheme 

    (define (make-interval a b)
      (cons a b))

    (define (lower-bound i) (car i))
    (define (upper-bound i) (cdr i))

=================
実行コード
=================

.. sourcecode:: scheme 

    (define ival (make-interval 1 5))
    (lower-bound ival) ;; => 1
    (upper-bound ival) ;; => 5