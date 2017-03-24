Exercise 2.10
=====================

:文責: @irration

========
解法
========

SICPブログ上で問題の解釈が二つに分かれているようだ.

1. -5 〜 3 のように, 文字通り 0 をまたがる区間でのエラーを実装する
2. 0 で割った際のエラーを実装する.

どうやら 2 ではなく 1 が正しいようなのでこちらを解く.
解釈が二つに割れた理由としては, 多くの人が 1 の状態を再現できないためと思われる. 
というのも, この問題は div-interval に関わる問題のように見えて実はそうではないからである( 実際, div-interval は正しい値を返すので上記の問題を再現できない ).

正しくは以下のプロセスに注目する必要があったのである.

.. sourcecode:: scheme

    (make-interval (/ 1.0 (upper-bound x)) (/ 1.0 (lower-bound x)))

実際にこのコードで 1 を試してみると, たちまち問題が顕在化する. 

.. sourcecode:: scheme

    (define i (make-interval -5 5))
      (make-interval (/ 1.0 (upper-bound i)) (/ 1.0 (lower-bound i))) ;; => (0.2, -0.2)

したがって, 方針として 与えられた区間の逆数の区間を返す手続きを実装する方向で考えていく. 

=================
解答
=================

.. sourcecode:: scheme 

    (define (reciprocal-interval x)
      (if (< (* (upper-bound x) (lower-bound x)) 0)
        (error "The arguments spans 0")  
        (make-interval (/ 1.0 (upper-bound x)) (/ 1.0 (lower-bound x)))))

=================
実行コード
=================

.. sourcecode:: scheme 

    (define ival-1 (make-interval 2 4))
    (define ival-2 (make-interval -5 5))
    (reciprocal-interval ival-1) ; ( 0.25 . 0.5 )
    (reciprocal-interval ival-2) ; ERROR: The arguments spans 0