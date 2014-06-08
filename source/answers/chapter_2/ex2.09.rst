Exercise 2.09
=====================

:文責: @irration

========
解法
========

日本語が難解であるが, 要するに以下を確かめよということである.

区間 ival-1, ival-2 が存在する場合に

(width (add-interval ival-1 ival-2)) が (width ival-1) と (width ival-2) の和(または差)と等しい.

(width (sub-interval ival-1 ival-2)) が (width ival-1) と (width ival-2) の和(または差)と等しい.

(width (mul-interval ival-1 ival-2)), (width (div-interval ival-1 ival-2))  が (width ival-1) と (width ival-2) の和(または差)と等しくない.

=================
解答・実行コード
=================

.. sourcecode:: scheme 

    (define ival-1 (make-interval 1 5))
    (define ival-2 (make-interval 9 15))

    (width ival-1) ; 2
    (width ival-2) ; 3
    (width (add-interval ival-1 ival-2)) ; 5
    (width (sub-interval ival-1 ival-2)) ; 5
    (width (mul-interval ival-1 ival-2)) ; 33
    (width (div-interval ival-1 ival-2)) ; 0.24444444444444446
