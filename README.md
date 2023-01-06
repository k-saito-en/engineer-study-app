![4cdf1c5482cd30174cfe](https://user-images.githubusercontent.com/111550856/210683481-2884eac0-efa4-4bcd-9e04-457688744441.png)

# engineer-study-app
[flutter_markdown](https://pub.dev/packages/flutter_markdown)を利用してメモ・ノートをmarkdown形式で表示、保存するメモアプリです。

本アプリを通して「今後のエンジニア人生におけるリファレンスコードとする」、「新しい技術を使ってみる練習場とする」ことを目的としています。

|  メモ一覧（Light）  |  メモ一覧（Dark）  |
| ---- | ---- |
|   ![Screenshot_20230105-102918](https://user-images.githubusercontent.com/111550856/210684671-92d66aa2-574f-4e4a-b0e5-cefa5e8003fa.png)|  ![Screenshot_20230105-102851](https://user-images.githubusercontent.com/111550856/210684692-beb80e9f-fe26-4343-95e1-9ee9d41c9aad.png)  |

|  メモ表示（Light）  |  メモ編集（Light）  |  メモ表示（Dark）  |  メモ編集（Dark）  |
| ---- | ---- | ---- | ---- |
|![Screenshot_20230105-103855](https://user-images.githubusercontent.com/111550856/210685173-25a90d20-f44a-452c-8d53-74bf69632dbe.png) | ![Screenshot_20230105-103835](https://user-images.githubusercontent.com/111550856/210685160-a30de5f6-51cc-42cd-b9f6-9f190f66f531.png)|![Screenshot_20230105-103931](https://user-images.githubusercontent.com/111550856/210685380-b355e445-c78d-4fc6-bf24-475c4185293a.png)|![Screenshot_20230105-103923](https://user-images.githubusercontent.com/111550856/210685464-e79abe72-4c37-495b-a966-fc7bab91176e.png)|


<img src="https://user-images.githubusercontent.com/111550856/210924562-4311a83a-a5ef-4928-a19e-8fd985dfe624.gif" width="50%">


## ビルド方法
__ソースコードをクローン__
```
git clone https://github.com/k-saito-en/engineer-study-app.git
```
__GitHubの個人アクセストークンを取得 （⚠️以下、今後実装予定の「GitHubリポジトリ検索機能」の前準備）__

本アプリで使用する GitHub の[個人アクセストークン](https://docs.github.com/ja/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)を取得して、カレントディレクトリで次のコマンドを実行してください。
```
# 引数で与えられた環境変数を基にビルドに必要な `lib/util/env/env.dart` を作成してくれます。
# 作成された `lib/util/env/env.dart` を直接編集しても大丈夫です。

bin/flutter_env -g [GitHub 個人アクセストークン] -s [検索文字列の初期値]
```
|  パラメータ  |        |  説明  |
| ---- | ---- | ---- |
|  `-g`  |  `Must`  |  値には [GitHub 個人アクセストークン](https://docs.github.com/ja/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) を設定してください。  |
|  `-s`  |  `Optional`  |  値には好きな文字列を設定してください。指定しない場合は空文字が設定されます。  |
|  `-h`  |        |  ヘルプを表示します。  |

## フォルダ構成
<pre>
.
├── main.dart
├── model　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　DB・状態管理モデルの定義
│   ├── db
│   │   ├── note_db.dart
│   │   └── note_db.g.dart
│   ├── freezed
│   │   └── note
│   │       ├── note_model.dart
│   │       └── note_model.freezed.dart
│   └── sp
│       └── notify_setting_sp.dart
├── view　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　画面表示の実装
│　　　　　　├── root.dart
│   ├── note
│   │   ├── editor
│   │   │   └── editor.dart
│   │   └── note_view.dart
│   ├── settings
│   │   ├── notify
│   │   │   └── notify_setting_view.dart
│   │   └── settings_view.dart
│   └── timeline
│       └── timeline_view.dart
└── view_model                                  ユーザーからのアクションに応じて画面表示を変更するロジック
    ├── note
    │   └── note_provider.dart
    └── timeline
        └── timeline_provider.dart
</pre>
