# jsample

### イントロダクション

まず、次のコマンドで必要なモジュールを組み込んでください。

$ npm install

次に、次のコマンドを実行して、必要なリソースファイル、jsファイルをwebroot/js以下に配置してください

$ gulp copy

$ gulp compile

webrootをApache等でマウントし、以下にアクセスしてください

### Ajaxを呼び出す簡単なアプリ

http://yourdomain/index.html

Ajaxで/api/ajax01.jsonを取得し、その中身をid="result"で指定されたDOMに記述します

### Ajaxのテスト

http//yourdomain/pages/test.html

Ajaxのテストは、testCallAjax01.coffeeで行っています。

1. callAjax01 with real HTML DOM test

初期処理(beforeEach)で、DOMに<div id="result">を追加し、Ajaxがそこに対して
HTMLを追加を行い、テストします。

  1. 毎回レスポンスを指定して返すサンプル

  request.respondWithを使い、リクエストに対して直接レスポンスを返すテスト

  2. 予め指定されたレスポンスを返すサンプル

  stubRequestを使い、予めレスポンスを用意しておいて、Ajaxの動作を確認するテスト

2. callAjax01 with fixture HTML test

初期処理でloadFixturesを行い、dummy.htmlを読み込みます。この読み込んだhtmlに
対して、Ajaxが処理を行い、テストします。

  1. 毎回レスポンスを指定して返すサンプル

  request.respondWithを使い、リクエストに対して直接レスポンスを返すテスト

  2. 予め指定されたレスポンスを返すサンプル

  stubRequestを使い、予めレスポンスを用意しておいて、Ajaxの動作を確認するテスト


### gulpコマンドのレファランス

$ gulp clean

webroot配下に配置したcoffeeスクリプトやリソースファイルを削除します。

$ gulp copy

webroot配下に、jasmineやfixturesなど、テストに必要なファイルをコピーします。

$ gulp compile

webroot配下に、CoffeeScriptのコードをコンパイルして配置します。
