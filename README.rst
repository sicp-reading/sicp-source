http://sicpreading.bitbucket.org
====================================


環境構築
==========

.. sourcecode:: sh

   $ source install.sh

更新手順
==========

1. このリポジトリを最新に pull して, Github の最新コードを merge する

.. sourcecode:: sh
   
   $ git pull origin master
   $ source venv/bin/activate
   $ make merge

2. 目次, 議事録など更新する

.. sourcecode:: sh
   
   $ tree . -L 2
   .
   |-- Makefile
   |-- README.rst
   |-- build
   |   |-- doctrees
   |   `-- html
   |-- index.html
   |-- install.sh
   |-- make.bat
   |-- requirements.txt
   |-- source
   |   |-- _static
   |   |-- _templates
   |   |-- answers
   |   |-- conf.py
   |   |-- discussion
   |   |-- histories.rst  ## <= 更新するファイル
   |   |-- index.rst  ## <= 更新するファイル
   |   `-- members.rst  ## <= 更新するファイル

3. ビルドしてローカルで確認する

.. sourcecode:: sh

   $ source venv/bin/activate
   $ make html
   $ open build/html/index.html

3. デプロイする

.. sourcecode:: sh

   $ make deploy

その他
=========

**ファイル更新を監視してビルド + ローカルで確認**

http://localhost:8000 でローカルで確認.

.. sourcecode:: sh

   $ source venv/bin/activate
   $ make watch

   ## 別のシェル
   $ source venv/bin/activate
   $ make run
