Exercise 2.4
=====================

:文責: @naoiwata

=====================
問題で与えられた式
=====================

.. sourcecode:: scheme

   (define (cons x y)
     (lambda (m) (m x y)))

   (define (car z)
     (z (lambda (p q) p)))

========
解答
========

(car (cons x y)) が x を生じることを, 手続きの順に追って, 処理を見ていく.

- (car (cons x y))
- (car (lambda (m) (m x y)))
- ((lambda (m) (m x y)) (lambda (p q) p))
- ((lambda (p q) p) x y)
- x

また, cdr の定義は以下のようになる.

.. sourcecode:: scheme

   (define (cdr z)
     (z (lambda (p q) q)))

テスト(実行コード) 
-------------------

.. sourcecode:: scheme

   (define (cons x y)
     (lambda (m) (m x y)))

   (define (car z)
     (z (lambda (p q) p)))

   (define (cdr z)
     (z (lambda (p q) q)))

    (define x-test (cons 2 7))
    (car x-test) ;; => 2
    (cdr x-test) ;; => 7
