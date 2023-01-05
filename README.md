![4cdf1c5482cd30174cfe](https://user-images.githubusercontent.com/111550856/210683288-c40cdc85-723f-4ebf-8acf-4fb1dd108271.png)


# engineer-study-app
これは、私がflutterで初めて作ったアプリです。MarkDown形式でのメモ、GitHubリポジトリの検索機能を実装予定です。

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
