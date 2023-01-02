// ignore_for_file: invalid_use_of_protected_member

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
    // NoteList画面で選択したNoteのListView内でのindexを保持
    final noteIndex = ref.read(currentNoteIndexProvider.notifier).state;
    // 現在のDBの状態を提供するプロバイダー
    final noteProvider = ref.watch(noteDatabaseProvider.notifier);
    // 現在DBに保存されているNoteを保持
    List<NoteItemData> noteItems = noteProvider.state.noteItems;
    // 現在編集中のNoteの状態を提供するプロバイダー
    // NoteListで押下したNoteの情報を保持し、本画面に表示するために使う
    final editNoteProvider = ref.watch(editingNoteProvider.notifier);

    // NoteListから受け取った情報を元にTextFieldに内容表示
    final currentNoteItem = noteItems[noteIndex];

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
            body: TabBarView(children: [
              // previewタブ
              const PreviewTab(),
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
                        // 内容変更時、即座に変更内容をTempNoteItemDataに反映
                        onChanged: (value) {
                          editNoteProvider.updateTempTitle(value);
                        },
                        // 入力完了後、即座に変更内容をTempNoteItemDataに反映
                        onSubmitted: (value) {
                          editNoteProvider.updateTempTitle(value);
                        },
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
                        // 内容変更時、即座に変更内容をTempNoteItemDataに反映
                        onChanged: (value) {
                          editNoteProvider.updateTempNoteText(value);
                        },
                        // 入力完了後、即座に変更内容をTempNoteItemDataに反映
                        onSubmitted: (value) {
                          editNoteProvider.updateTempNoteText(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}

//previewタブの実装
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
