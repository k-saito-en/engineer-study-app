![4cdf1c5482cd30174cfe](https://user-images.githubusercontent.com/111550856/210683481-2884eac0-efa4-4bcd-9e04-457688744441.png)

# engineer-study-app
[flutter_markdown](https://pub.dev/packages/flutter_markdown)を利用してメモ・ノートをmarkdown形式で表示、保存するメモアプリです。

本アプリを通して「今後のエンジニア人生におけるリファレンスコードとする」、「新しい技術を使ってみる練習場とする」ことを目的としています。

|  メモ一覧（Light）  |  メモ一覧（Dark）  |
| ---- | ---- |
|   ![Screenshot_20230105-102918](https://user-images.githubusercontent.com/111550856/210684671-92d66aa2-574f-4e4a-b0e5-cefa5e8003fa.png)|  ![Screenshot_20230105-102851](https://user-images.githubusercontent.com/111550856/210684692-beb80e9f-fe26-4343-95e1-9ee9d41c9aad.png)  |

|  メモ表示（Light）  |  メモ編集（Light）  |  メモ表示（Dark）  |  メモ編集（Dark）  |
| ---- | ---- | ---- | ---- |
|![Screenshot_20230105-103835](https://user-images.githubusercontent.com/111550856/210685160-a30de5f6-51cc-42cd-b9f6-9f190f66f531.png) | ![Screenshot_20230105-103855](https://user-images.githubusercontent.com/111550856/210685173-25a90d20-f44a-452c-8d53-74bf69632dbe.png)|![Screenshot_20230105-103931](https://user-images.githubusercontent.com/111550856/210685380-b355e445-c78d-4fc6-bf24-475c4185293a.png)|![Screenshot_20230105-103923](https://user-images.githubusercontent.com/111550856/210685464-e79abe72-4c37-495b-a966-fc7bab91176e.png)|

後でgif画像を添付し直す
メモ新規作成
https://user-images.githubusercontent.com/111550856/210686424-ab32eada-2cb3-41af-b534-2c510cc5d144.mp4

メモ編集
https://user-images.githubusercontent.com/111550856/210686473-90194df3-a910-43b5-9db4-c53f712112ad.mp4

メモ削除
https://user-images.githubusercontent.com/111550856/210686520-705ed1f0-281b-427c-a34f-8ecec385ad2f.mp4



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
