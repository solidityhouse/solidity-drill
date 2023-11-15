# 実装
[test/ch01/Platform.t.sol](../../../test/ch01/Platform.t.sol)でコメントアウトされているソースコードを解除して、
```
forge test --mc PlatformTest01
```
を実行するとコンパイルエラーが発生します

これがテスト駆動開発の最初のステップ（エラー確認）です

これを解消するように[src/ch01/Platform.sol](../../../src/ch01/Platform.sol)の実装をしてください

すべてのエラーを解消し、テストコマンドの実行結果が
```
Test result: 0 failed; 0 skipped
```
になれば実装完了です

answerフォルダにあるファイルと自身の実装を見比べてみましょう

---
上記を完了したら[ch02/01-introduction](../ch02/01-introduction.md)に進んでください