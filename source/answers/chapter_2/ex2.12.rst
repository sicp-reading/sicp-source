Exercise 2.12
=====================

:文責: @irration

=================
解答
=================

.. sourcecode:: scheme 

    (define (make-center-width c w)
      (make-interval (- c w) (+ c w)))

    (define (center i)
      (/ (+ (lower-bound i) (upper-bound i)) 2))

    (define (width i)
      (/ (- (upper-bound i) (lower-bound i)) 2))

    (define hoge (make-center-width 5.0 0.15))

    (define (make-center-percent center p)
      (let ((width (/ (* center p) 100)))
      (make-center-width center width)))
     
=================
実行コード
=================

.. sourcecode:: scheme 

    (define i1 (make-center-percent 100 5))
    (define i2 (make-center-percent 200 2))
    i1 ; => (95 . 105)
    i2 ; => (196 . 204)
