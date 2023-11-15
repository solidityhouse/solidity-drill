# テスト
追加した制約が正しく機能しているかを確認するテストを記述します

`src/ch02/Platform.sol`に`src/ch01/Platform.sol`を張り付けてください

[test/ch02/Platform.t.sol](../../../test/ch01/Platform.t.sol)のコメントアウトを解除してください

```
forge test --mc PlatformTest02
```
を実行するとテストが通過することが確認できます（ch01と同じ状態のため）

ここから、エラーハンドリングのテストを追加します

エラーハンドリングをするテストは`test_{act}_fail_{description}`という関数名にするのが通例です

教科書のFoundry/VM/vm.expectRevertセクションを参考に実装してください

テストを追加した状態で
```
forge test --mc PlatformTest02
```
を実行して追加したテストがFailするのを確認してください

---

上記を完了したら[04-impl](./04-impl.md)に進んでください
