Exercise 2.2
=====================

:文責: @irration

========
解答
========

.. sourcecode:: scheme 

  (define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

  ;get the average of two numbers
  (define (avg x y) (/ (+ x y) 2))

  ; definitions about segment
  (define (make-segment p1 p2) (cons p1 p2))
  (define (start-segment segment) (car segment))
  (define (end-segment segment) (cdr segment))

  ; definitions about point
  (define (make-point x y) (cons x y))
  (define (x-point point) (car point))
  (define (y-point point) (cdr point))

  ; returns mid-point
  (define (midpoint-segment segment)
    (let ((s1 (start-segment segment))
          (s2 (end-segment segment)))
      (make-point
        (avg (x-point s1) (x-point s2))
        (avg (y-point s1) (y-point s2)))))

=================
実行コード
=================

.. sourcecode:: scheme 

  (define p1 (make-point 4 9))
  (define p2 (make-point 12 17))
  (define seg (make-segment p1 p2))
  (midpoint-segment seg) ;; => (8, 13)
