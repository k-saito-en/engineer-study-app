import 'dart:developer';

import 'package:engineer_study_app/note.dart';
import 'package:engineer_study_app/note_list.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../providers.dart';

class Editor extends HookConsumerWidget {
  const Editor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 各プロバイダーの状態を監視している
    final noteId = ref.watch(currentNoteIdProvider.notifier).state;
    final isLargeScreen = ref.watch(isLargeScreenProvider);
    final noteList = ref.read(noteListProvider);

    final note = noteId.isEmpty
        ? null
        : noteList.firstWhere((note) => note.id == noteId);

    // 新規作成の場合の処理
    final nameController = useTextEditingController();
    nameController.text = note?.name ?? '';

    final textController = useTextEditingController();
    textController.text = note?.text ?? '';

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              actions: [
                if (note != null)
                  PopupMenuButton<String>(
                    initialValue: '',
                    icon: const Icon(Icons.more_vert),
                    // 削除処理の呼び出し
                    onSelected: (value) {
                      ref.read(currentNoteIdProvider.notifier).state = '';
                      ref.read(noteListProvider.notifier).delete(note.id);

                      if (!isLargeScreen) {
                        Navigator.pop(context);
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      )
                    ],
                  ),
              ],
              bottom: const TabBar(tabs: [
                Tab(
                  child: Text('preview'),
                ),
                Tab(
                  child: Text('editing'),
                )
              ]),
            ),
            // widgetの大きさが端末画面以上になる場合にスクロールできるようにするwidget
            body: TabBarView(children: [
              // previewタブの実装
              Container(
                  margin: const EdgeInsets.all(20),
                  child: Markdown(data: textController.text)),
              // editingタブの実装
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 16, right: 16, top: 24, bottom: 4),
                          hintText: 'Note name',
                        ),
                        controller: nameController,
                        onChanged: (nextName) {
                          ref
                              .read(noteListProvider.notifier)
                              .update(id: noteId, name: nextName);
                        },
                        enabled: note != null,
                      ),
                    ),
                    // メモ本文入力フィールドの実装
                    SizedBox(
                      child: TextField(
                        maxLines: null,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 16, right: 16, top: 4, bottom: 16),
                          hintText: 'Note content',
                        ),
                        controller: textController,
                        onChanged: (nextText) {
                          // ref
                          //     .watch(previewProvider.notifier)
                          //     .previewText(nextText);
                          ref
                              .read(noteListProvider.notifier)
                              .update(id: noteId, text: nextText);
                        },
                        enabled: note != null,
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}