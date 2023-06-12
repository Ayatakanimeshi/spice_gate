■ サービス概要
スパイスカレーに興味があるが一歩踏み出せない人達に
入口となる情報を与え、スパイスカレーを食べに行くきっかけを作る
スパイスカレー特化型の口コミアプリです。

■ ユーザーが抱える課題
スパイスカレーの辛さがどの程度なのか分からないため、食べに行くのを躊躇ってしまう。

■ 課題に対する仮説

口コミを見ても、その人が辛さ耐性がある人かどうか分からないので、参考にならない

- 自分の辛さ耐性で安心して食べる事が出来るかわからない
  1. 口コミを見ても、投稿している人が辛さ耐性がある人かどうか分からず参考にならない
  2. スパイスカレーの辛さの基準が分からない
  3. いろんな種類が多すぎて、どのお店が一番最適か分からない

■ 解決方法

- ユーザーの辛さ耐性を自己評価していただき、その上で食べたカレーの辛さレベルを評価してもらう
  - 辛さ耐性の低い人の投稿を参考に行く店を決める事ができる
  - 辛さに慣れて、辛いカレーを食べる事ができるようになる過程を楽しむ事ができる

■ メインのターゲットユーザー
カレーに興味のある人全て
ランチ情報を求めている社会人の方、カフェ巡りなど ○○ 巡りが好きな方
カレー巡りにハマっている方の SNS を見ている方にも使っていただきたい

■ 実装予定の機能（以下の例は実際のアプリの機能から一部省略しています）

- 投稿者ユーザー

  - 自分のプロフィールを作成できる
    - 名前・性別・年代・都道府県・プロフィール画像・辛さレベルを初期のプロフィールに設定できる
    - 自分の投稿一覧を閲覧できる
    - 自分の食したカレーの皿数を閲覧できる
  - 自分のプロフィールを編集・削除できる
    - 名前・性別・年代・都道府県・プロフィール画像・辛さレベルを編集できる
    - アカウントを削除できる
    - プロフィール画像を削除できる
  - 食べたカレー、お店を投稿できる
    - 店名・都道府県・食べたメニュー名・カレーの辛さレベル・カレーの画像を投稿できる
      - 店舗情報はユーザーが登録する　一度登録した店舗情報は保管し、投稿時の店名一覧に表示して選択できる
      - 投稿時の位置情報を保存する事ができる
  - 投稿を編集・削除できる
    - 店名・都道府県・食べたメニュー名・カレーの辛さレベル・カレーの画像を編集できる
    - 投稿を削除できる

- 閲覧者ユーザー

  - 投稿を閲覧できる
    - 店名・都道府県・食べたメニュー名・投稿者・投稿日時・カレーの辛さレベル・カレーの画像を閲覧できる
    - 投稿にコメント・いいねをすることができる
  - お店情報を閲覧できる
    - 店名・都道府県・営業時間、定休日、住所、電話番号、アクセス方法、お店の説明、お店の画像を閲覧できる
    - お店の位置情報を取得できる
    - カレーのメニューを閲覧できる（投稿者が食べたカレーを表示）
    - カレーの辛さレベルを閲覧できる（投稿者が食べたカレーの辛さレベルを表示）
  - 投稿者ユーザーのプロフィールを閲覧できる
    - 投稿者ユーザーの名前・性別・年代・都道府県・プロフィール画像・辛さレベルを閲覧できる（初期のプロフィール設定時に入力する内容）
    - 投稿者ユーザーの投稿一覧を閲覧できる
    - 投稿者ユーザーの食したカレー皿数を閲覧できる
  - 検索機能を使用できる(パーシャルファイルにて実装)
    - 投稿を検索できる
      - 店名・都道府県・辛さレベルを使い検索できる
    - お店を検索できる
      - 店名・都道府県・辛さレベルを使い検索できる
      - 現在地の近くのお店を検索できる（位置情報を使用）
    - 投稿者ユーザーを検索できる
      - 投稿者ユーザーの名前・性別・年代・大まかな住所・辛さレベルを使い検索できる

- 管理者ユーザー

  - 投稿者ユーザーの検索、一覧、詳細、編集、削除
  - 投稿の検索、一覧、詳細、編集、削除
  - 店舗情報の検索、詳細、作成、編集、削除
  - 管理ユーザーの一覧、詳細、作成、編集、削除

■ なぜこのサービスを作りたいのか？
３年前にスパイスカレーにハマり、毎月 10 皿以上のスパイスカレーを食してきました。
今では辛さに耐性が出来た私ですが、元々は辛いのが苦手な人間でした。
初期の頃は口コミサイトを色々調べ、少ない情報で辛すぎないお店を探すものの、
口コミ投稿している方はカレー好きが多く、辛さに慣れているため参考にならない場面が多かったです。
そこで、辛さ耐性の低い人の投稿を参考に行く店を決める事ができるアプリを作りたいと思いました。
Spice Gate のアプリ名通り、スパイスカレーの入口となり、食べに行くきっかけを作りたいと考え、このサービスを作る事を決めました。

■ スケジュール

企画〜技術調査：12/4 〆切
README〜ER 図作成：12/10 〆切
メイン機能実装：12/10 - 1/15
β 版を RUNTEQ 内リリース（MVP）：1/15 〆切
本番リリース：1 月末

企画〜技術調査：6/14 〆切
README〜ER 図作成：6/20 〆切
メイン機能実装：6/20 - 7/25
β 版を RUNTEQ 内リリース（MVP）：7/25 〆切
本番リリース：8 月中旬

■ 技術選定

- Rails7
- postgresql
- JavaScript
- Bootstrap
- heroku
- Geolocation API
- Places API
