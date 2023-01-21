# コーディング規約

ほぼ自分用メモです。
これを作成する以前のものは規約に則っていないことが多いが、それは追々修正していく(予定)。

## 命名規則

### 定数

- `upper_snake_case`
- `readonly` で宣言
- `modules/__vars` 内で宣言

### 変数

- `lower_snake_case`
- ローカル変数
    - `local` で宣言
    - プレフィックスとして`_`をつける
        - ex.) `_local_var`
- グローバル変数
    - `modules/__vars` 内で宣言
    - オプション変数のみ `modules/__options` 内で宣言

### 関数

- モジュール名::`lower_snake_case`
    - ex.) `__module::my_func`
- `function` は省略

### モジュール

- ファイル名はプレフィックスとして `__`をつける
    - ex.) `__core`
- `modules` ディレクトリ内に配置
- Shebangは設定しない
    - モジュール単体で実行しないため
- 行頭にvimのモードラインを記述
    - ex.) `# vim: set ft=bash :`

## 関数の戻り値

必ず整数値を `return` する

- 正常に終了した場合は `0`
- 異常終了の場合は `1 ~ 255`

## 変数の使用

変数の使用時は必ずカギ括弧を使う

```bash
echo "${var}"
```
