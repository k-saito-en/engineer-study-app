import 'package:engineer_study_app/model/db/note_db.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:engineer_study_app/view_model/note/note_provider.dart';

class Editor extends HookConsumerWidget {
  const Editor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 各プロバイダーの状態を監視している
    final noteIndex = ref.read(currentNoteIndexProvider.notifier).state;
    // final isLargeScreen = ref.watch(isLargeScreenProvider);
    final noteProvider = ref.watch(noteDatabaseProvider.notifier);
    List<NoteItemData> noteItems = noteProvider.state.noteItems;

    final editNoteProvider = ref.watch(editingNoteProvider.notifier);

    final currentNoteItem = noteItems[noteIndex];

    // 新規作成の場合の処理
    final titleController = useTextEditingController();
    titleController.text = currentNoteItem.title;

    final textController = useTextEditingController();
    textController.text = currentNoteItem.noteText;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    noteProvider.updateData(editNoteProvider.state);
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.view_list)),
              actions: [
                PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    )
                  ],
                  onSelected: (_) {
                    noteProvider.deleteData(editNoteProvider.state);
                    Navigator.pop(context);
                  },
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
              // Container(
              //     margin: const EdgeInsets.all(20),
              //     child: Markdown(data: editNoteProvider.state.noteText)),
              PreviewTab(),
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
                        controller: titleController,
                        onChanged: (value) {
                          editNoteProvider.updateTempTitle(value);
                          // temp = temp.copyWith(title: value);
                        },
                        onSubmitted: (value) {
                          editNoteProvider.updateTempTitle(value);
                          // temp = temp.copyWith(title: value);
                        },
                        enabled: currentNoteItem != null,
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
                        onChanged: (value) {
                          editNoteProvider.updateTempNoteText(value);
                          // temp = temp.copyWith(noteText: value);
                        },
                        // 入力完了後の処理
                        onSubmitted: (value) {
                          editNoteProvider.updateTempNoteText(value);
                          // temp = temp.copyWith(noteText: value);
                        },

                        enabled: currentNoteItem != null,
                      ),
                    ),
                  ],
                ),
              ),
            ])));

    // tempがおかしい
    // idは積み上がっていく
  }
}

class PreviewTab extends HookConsumerWidget {
  const PreviewTab({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editNoteProvider = ref.watch(editingNoteProvider.notifier);

    return Container(
        margin: const EdgeInsets.all(20),
        child: Markdown(data: editNoteProvider.state.noteText));
  }
}
