// ignore_for_file: invalid_use_of_protected_member

import 'package:engineer_study_app/model/db/note_db.dart';
import 'package:engineer_study_app/view/note/editor/editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:engineer_study_app/view_model/note/note_provider.dart';

class NoteList extends HookConsumerWidget {
  const NoteList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TempNoteItemDataの状態取得、編集を可能にする
    final editNoteProvider = ref.watch(editingNoteProvider.notifier);
    // Providerのメソッドや値を取得。
    final noteProvider = ref.watch(noteDatabaseProvider.notifier);
    // Providerが保持しているnoteItemsを取得。
    List<NoteItemData> noteItems = noteProvider.state.noteItems;
    

    return Scaffold(
      body: ListView(children: [
        for (var i = 0; i < noteItems.length; i++) ...[
          Slidable(
            endActionPane: ActionPane(
              //スライドしたときに表示されるボタン
              motion: const DrawerMotion(),
              //スライドしたときのアニメーション
              children: [
                SlidableAction(
                  flex: 1,
                  //長さ
                  onPressed: (_) async {
                    //押された時の処理
                    editNoteProvider.updateAllTemp(
                        noteItems[i].id,
                        noteItems[i].title,
                        noteItems[i].noteText,
                        // noteItems[i].limitDate,
                        noteItems[i].isNotify);
                    await noteProvider.deleteData(editNoteProvider.state);
                  },
                  icon: Icons.delete,
                  //アイコン
                ),
              ],
            ),
            child: ListTile(
              title: Text(noteItems[i].title),
              subtitle: Text(noteItems[i].limitDate == null
                  ? ""
                  : noteItems[i].limitDate.toString()),
              onTap: () async {
                editNoteProvider.updateAllTemp(
                    noteItems[i].id,
                    noteItems[i].title,
                    noteItems[i].noteText,
                    // noteItems[i].limitDate,
                    noteItems[i].isNotify);
                // temp = temp.copyWith(id: noteItems[i].id);
                ref.read(currentNoteIndexProvider.notifier).state = i;
                await Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Editor()));
              },
            ),
          ),
        ]
      ]),
      // 新規メモ追加処理を実装
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          editNoteProvider.updateTempNoteText('NoteText');
          editNoteProvider.updateTempTitle('New Note');
          await noteProvider.writeData(editNoteProvider.state);
        },
      ),
    );
  }
}
