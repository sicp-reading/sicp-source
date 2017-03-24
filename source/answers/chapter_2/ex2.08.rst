Exercise 2.08
=====================

:文責: @irration

========
解法
========

二つの区間の差とは何か少々わかりづらいのでここで解説しておく.
二つの区間 ival-1( a ~ b ), ival-2( c ~ d ) が存在する場合, ival-2 の左端( c )から ival-1 の右端( b )を引いたものを 最小の区間, ival-2 の右端( d )から ival-2の左端( a )を引いたものが最大の区間として扱う.

========
解答
========

.. sourcecode:: scheme 

    (define (sub-interval x y)
      (make-interval (- (lower-bound y) (upper-bound x))
                     (- (upper-bound y) (lower-bound x))))

=================
実行コード
=================

.. sourcecode:: scheme 

    (define ival-1 (make-interval 1 5))
    (define ival-2 (make-interval 9 15))

    (sub-interval ival-1 ival-2) ;; => (4 . 14)

