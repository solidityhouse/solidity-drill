# システム設計
システムである「コンサートチケット販売プラットフォーム」の設計をします

# 変数
以下の変数を持つ
- Concert
  - コンサート情報をまとめた構造体
  - 以下のメンバーを持つ
    - title(string)
      - コンサートのタイトル
    - sellingTickets(uint)
      - 売り出されるチケット枚数
    - remainingTickets(uint)
      - 残りのチケット枚数
      - 初期値はsellingTickets
- concerts
  - Concert構造体を保存する動的配列
- collectedTicket
  - ユーザーがあるコンサートのチケットを購入したかどうかをフラグ保持するマッピング

## 関数
以下の関数を持つ
- registConcert
  - アクト「コンサートを登録する」に対応する
  - 以下の引数を持つ
    - title(string)
    - sellingTickets(uint)
  - Concertをconcertsに格納する
  - concertsのインデックスがconcertIdとなる
　- sellingTicketsが0の場合「SellingTickets must be greater than 0」というエラーを返す
- getConcertInfo
  - アクト「コンサート情報を確認する」に対応する
  - 以下の引数を持つ
    - concertId(uint)
  - concertIdに対応したConcertを返す
- buyTicket
  - アクト「チケットを購入する」に対応する
  - 以下の引数を持つ
    - concertId(uint)
  - concertIdが存在しない場合「The concertId does not exist」というエラーを返す
  - すでにチケットを保有している場合「Tickets cannot be bought twice」というエラーを返す
  - 残りのチケット枚数が0の場合「There are no remaining tickets available」というエラーを返す
- hasTicket
  - アクト「チケット保有を確認する」に対応する
  - 以下の引数を持つ
    - concertId(uint)
  - 以下の返り値を持つ
    - bool
  - concertIdに対応したConcertのチケットを購入済みかどうか返す