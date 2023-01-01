import 'package:engineer_study_app/model/db/note_db.dart';
import 'package:engineer_study_app/model/freezed/note/note_model.dart';
import 'package:engineer_study_app/view/note/editor/editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:engineer_study_app/view_model/note/note_provider.dart';

class NoteList extends HookConsumerWidget {
  const NoteList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editNoteProvider = ref.watch(editingNoteProvider.notifier);
    final noteState = ref.watch(noteDatabaseProvider);
    //Providerの状態が変化したさいに再ビルドします
    final noteProvider = ref.watch(noteDatabaseProvider.notifier);
    //Providerのメソッドや値を取得します
    //bottomsheetが閉じた際に再ビルドするために使用します。
    List<NoteItemData> noteItems = noteProvider.state.noteItems;
    //Providerが保持しているnoteItemsを取得。

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
                // 作業台に編集したいNoteデータを載せるイメージ
                editNoteProvider.updateAllTemp(
                    noteItems[i].id,
                    noteItems[i].title,
                    noteItems[i].noteText,
                    // noteItems[i].limitDate,
                    noteItems[i].isNotify);
                // temp = temp.copyWith(id: noteItems[i].id);
                ref.read(currentNoteIndexProvider.notifier).state = i;
                await Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Editor()));
              },
            ),
          ),
        ]
      ]),
      //ListViewでtilesを表示します。
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // tempを新規作成時の状態にし、
          editNoteProvider.updateTempNoteText('NoteText');
          editNoteProvider.updateTempTitle('New Note');
          // temp = temp.copyWith(title: 'Untitled', noteText: 'Memo');
          await noteProvider.writeData(editNoteProvider.state);
        },
      ),
    );
  }
}
