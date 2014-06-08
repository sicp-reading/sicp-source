Exercise 2.11
=====================

:文責: @irration

========
解法
========

これまでの mul-interval 手続きは非常にシンプルに見えるが, どの区間を計算する場合でも必ず4回の乗算が発生するため, これを場合分けして最小限に抑えよう, という問題. コード自体は従来の mul-interval より長くなる.

=================
解答
=================

.. sourcecode:: scheme 

    (define (mul-interval x y)
      (let
        ((mi make-interval)
         (lx (lower-bound x))
         (ux (upper-bound x))
         (ly (lower-bound y))
         (uy (upper-bound y)))
      (cond
        ((and (neg-int? x) (neg-int? y))
          (mi (* lx ly) (* ux uy)))
        ((and (neg-int? x) (zero-span? y))
          (mi (* lx uy) (* lx ly)))
        ((and (neg-int? x) (pos-int? y))
          (mi (* ux uy) (* lx ly)))
        ((and (zero-span? x) (neg-int? y))
          (mi (* ux uy) (* lx uy)))
        ((and (zero-span? x) (pos-int? y))
          (mi (* lx uy) (* ux uy)))
        ((and (pos-int? x) (neg-int? y))
          (mi (* ux uy) (* lx ly)))
        ((and (pos-int? x) (zero-span? y))
          (mi (* ux ly) (* ux uy)))
        ((and (pos-int? x) (pos-int? y))
          (mi (* lx ly) (* ux uy)))
        ((and (zero-span? x) (zero-span? y))
          (mi (min (* lx uy) (* ux ly)) (max (* lx ly) (* ux uy)))))))
     
=================
実行コード
=================

.. sourcecode:: scheme 

    (define i1 (make-interval -5 3))
    (define i2 (make-interval -2 110))
    (mul-interval i1 i2) ;; => (-550, 330)
