'(sicp-reading 運用)
=====================

:author: @naoiwata
:date: 2014/6/04
:version: 0.0.2

===========
はじめに
===========

- sicpreading のソース構成とその運用方法, reST 記述方式をまとめる.

========================================
sicpreading のソース構成と運用方法
========================================

`sicp-source リポジトリ <https://github.com/sicp-reading/sicp-source>`_
------------------------------------------------------------------------------

- 読解と解答を reST 形式で書いていく.

- issue にラベル付けをしてタスクを確認し作業する.
  
  - ラベルの種類は discussion, answers, review, bugfix など.
  
- 小さな修正以外は基本的に PR/1.2.3 や PR/ex1.2 などのブランチを作成して PR する. PR した人以外がレビューをして問題なければ master ブランチにマージする. 
  
- レビューのコメントや議論は基本的に issue のコメント欄に書く.


`sicp-reading.github.io リポジトリ <https://github.com/sicp-reading/sicp-reading.github.io>`_
------------------------------------------------------------------------------------------------------

- sicp-source リポジトリのソースをビルドした html を置く.
  
- http://sicp-reading.github.io に公開される.

===============
Github 使い方
===============

PullRequest 駆動開発
-----------------------

- 振り分けられた issue に対して branch を作成し, master に対して PR を送る.
- PR を送った人以外がレビューをして問題なければ merge する.

------------------
PR のお作法
------------------

1. sicp-source リポジトリの最新の master ブランチから PR/ex1.2 や PR/1.2.3 などのブランチを作成.
2. 形式に沿ってファイルに内容を記載する.
3. ローカルで HTML をビルドして LaTex や S 式などの表記に問題がないか確認する.
4. source/index.rst に追加したファイルの目次リンクを追記する.
5. sicp-source リポジトリの最新の master ブランチへ PR を送る.

担当分は issue で管理
-----------------------

- issue を作成して担当者に振り分ける.
- issue を作成する時は Label をつける.
- Label は discussion(節の読解), answers(問題の回答), review(担当範囲のレビュー), question(質問), bug(記法のミスなど), hotfix(小さい修正)などがある.

==========    
開発方法
==========

ローカルで環境構築
-----------------------

Python2.7 の virtualenv が使えることが前提.

.. sourcecode:: sh

   $ git clone git@github.com:sicp-reading/sicp-source.git
   $ cd sicp-source
   $ source install.sh 

ローカルで作業
------------------

------------------------------------------------------
ファイル更新を自動監視して html をビルドさせる.
------------------------------------------------------

.. sourcecode:: sh

   $ source venv/bin/activate; make watch

---------------------------------------------------
Web サーバを起動して表示確認. 
---------------------------------------------------

(別のシェルを起動して) 下のコマンド実行後, http://localhost:8888 を開いてブラウザで確認する.

.. sourcecode:: sh

   $ source venv/bin/activate; make run

-----------------------
html をビルドする
-----------------------

.. sourcecode:: sh

   $ source venv/bin/activate; make html

デプロイ方法
--------------

Travis CI を使う(方法/手順は後で追記.)

==========================
reST 記入フォーマット
==========================

discussion
-------------

.. sourcecode:: rst

   1.3.3 lambda かわいいよ
   ==========================================
   
   :文責: @naoiwata
   :レビュー: @amasok23

   ===========
   本節の目的
   ===========
   
   この節で学ぶべきこと, 目的を書く.
 
   =========
   見出し 1
   =========

   =========
   見出し 2
   =========

   小見出し
   ----------

   Scheme のコード

   .. sourcecode:: scheme

       (define (sqrt x)
         (fixed-point (lambda (y) (/ x y))
                      1.0))

   画像を挿入

   .. image:: img/sample.png

   ==========
   まとめ
   ==========

   この節のまとめ, 学んだこと, 抑えておくべきポイントを書く.
   
   
answers
-------------

.. sourcecode:: rst

      
   Exercise 1.1
   ==========================================
   
   :文責: @naoiwata
   :レビュー: @amasok23

   ===========
   解法
   ===========
   
   どう考えどう解いていったのか方針などを書く.(任意)
 
   =========
   解答
   =========

   解答のコードを書く.

   =========
   実行コード
   =========

   ここをコピペして REPL に貼り付けたら同じ解答が得られるようコードを全て明記する.
   解答は以下の例のように ;; => と明記する.

   .. sourcecode:: scheme

       (* 10 10) ;; => 100

   ==========
   結論
   ==========

   考察せよ, 論じよ, 系の問題は結論を書く.(任意)
