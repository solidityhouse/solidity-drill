# Introduction
制約条件のモデリング、テスト記述の実践を行います

## 制約条件
ch01では単純な値の登録・取得を実装しました

現在実装しているコードでは以下のような状況の考慮がされていません

- すでにチケットを保有している購入者が再度購入した場合
- 残りのチケット枚数が0枚の時に購入した場合
- 販売チケット枚数を0枚でコンサート登録した場合

このような仕様の穴に対して適切な対応を検討し、テストで振る舞いを規定し、それに沿う実装を行います

## 前提条件
- ch01の理解
- 教科書のSolidity/AccessControlの理解
- 教科書のMermaidセクターの理解
- 教科書のFoundryセクターの理解

---
前提条件を完了したら[02-design](./02-design.md)に進んでください