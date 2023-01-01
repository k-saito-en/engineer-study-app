

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:engineer_study_app/view/root.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      // primarySwatch: 自分で定義したMaterialColorを使うこともできる
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      // darkTheme: ダークモード用のテーマを設定
      darkTheme: ThemeData.dark(),
      home: const Root(),
    );
  }
}
