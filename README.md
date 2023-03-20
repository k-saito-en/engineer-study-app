
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


## 技術スタック
- アプリ機能
  - [flutter_markdown](https://pub.dev/packages/shared_preferences)でのmarkdown形式のメモ表示と編集
  - メモを作成日順に並べ替える
  - メモに通知日時を付与し、TODOリストとして使用（実装途中）
- [Drift](https://pub.dev/packages/drift)を利用したローカルデータベース構築
- [hooks_riverpod](https://pub.dev/packages/hooks_riverpod)・[freezed](https://pub.dev/packages/freezed)によるDB・メモ表示画面の状態管理
- ダークモードへの対応
- [shared_preferences](https://pub.dev/packages/shared_preferences)での設定情報保持
- 対応プラットフォーム
  - iOS/Android

### 今後対応予定
- GitHub リポジトリの検索と詳細表示（実装予定）
- Sliver を使った無限スクロール対応（実装予定）
- テストコードを書く（Widgetテスト・Integration テスト）

## フォルダ構成
<pre>
.
├── main.dart
├── model　　　　　　　　　　　　　　　　　　　　　　　　
│   ├── db
│   │   ├── note_db.dart
│   │   └── note_db.g.dart
│   ├── freezed
│   │   └── note
│   │       ├── note_model.dart
│   │       └── note_model.freezed.dart
│   └── sp
│       └── notify_setting_sp.dart
├── view　　　　　　　　　　　　　　　　　　　　　　　　
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
└── view_model                                  
    ├── note
    │   └── note_provider.dart
    └── timeline
        └── timeline_provider.dart
</pre>

## 環境
|      |    Version    |
| ---- | ---- |
|  Flutter  |    3.3.10    |
|  Dart  |    2.18.6    |

### コードの自動生成
- `freezed` を使った `g.dart` ファイルを変更した場合は次のコマンドを実行してください。
```
# 初回生成の場合
flutter pub run build_runner build

# 2回目以降　（不整合が起きたファイルを削除するコマンドを付加）
% flutter pub run build_runner build --delete-conflicting-outputs
```



