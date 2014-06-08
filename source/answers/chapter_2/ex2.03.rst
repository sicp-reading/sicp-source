Exercise 2.3
=====================

:文責: @irration

===========
解法
===========

「問題2.2が使いたくなるであろう」と書かれているので, 一見線分を使う問題ではないかと考えてしまいそうだが, 実際に使用するのは「x-point」「y-point」の方である.

問題となっているのは長方形なので, xy軸上に表現する上では, 左下の点 及び 右上の点 の二点さえ分かっていれば十分である. すなわち, (rectangle left-bottom right-top) というような形で表現する.

また, 今回問題となっているのは「周囲の長さ」と「面積」であり, どちらも長方形の「横」の長さと「縦」の長さを必要とするため, 長方形を引数として取り,該当の長方形の「width」と「height」を返す手続きを作成しておくと楽である.

========
解答
========

.. sourcecode:: scheme 

    ; create a rectangle
    (define (rectangle left-bottom right-top)
      (cons left-bottom right-top))

    ; selectors for getting points of a rectangle
    (define (left-bottom rectangle) (car rectangle))
    (define (right-top rectangle) (cdr rectangle))

    ; returns width of a rectangle
    (define (width rectangle)
      (- (x-point (right-top rectangle))
         (x-point (left-bottom rectangle))))

    ; returns height of a rectangle
    (define (height rectangle)
      (- (y-point (right-top rectangle))
         (y-point (left-bottom rectangle))))

    (define (perimeter rectangle)
      (* 2 (+ (width rectangle) (height rectangle))))

    (define (area rectangle)
      (* (width rectangle) (height rectangle)))

=================
実行コード
=================

.. sourcecode:: scheme 

    (define p1 (make-point 4 9))
    (define p2 (make-point 12 17))
    (define r (rectangle p1 p2))

    (perimeter r) ;; => 32
    (area r) ;; => 64

