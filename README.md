# Redmine copy category plugin
- チケットを作成/更新した時にカテゴリを指定したカスタムフィールドにコピーするプラグインです。
- プロジェクトをまたがってカテゴリを串刺し検索したかったので作成しました。

## Instllation
- モジュールのコピー
```
$ git clone git://github.com/gozuk16/redmine_copy_category.git plugins/redmine_copy_category
```
- gemのインストール
    - HAMLを使っているのでredmineのGemfileに gem "haml" を追加して bundle install してください。
- redmineの再起動
- カスタムフィールドの作成
    - 適当な名前のカスタムフィールドをリストで作成します。
    - リストにはコピー元のカテゴリと同じ項目を記述します。
    - 利用するトラッカーを選択し、フィルタおよび検索キーとして利用できるように設定します。
- プラグインの設定
    - 管理のプラグインから設定を選ぶとカスタムフィールを設定する画面になります。コピー先のカスタムフィール設定してください。
- プロジェクトの設定
    - 利用するプロジェクトでカスタムフィールドを設定します。

## Versions
- redmine 2.2.x
