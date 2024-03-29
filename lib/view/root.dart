import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:engineer_study_app/view/note/note_view.dart';
import 'package:engineer_study_app/view/timeline/timeline_view.dart'; //追加
import 'package:engineer_study_app/view/settings/settings_view.dart'; //追加

class Root extends HookConsumerWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> keys = ["Home", "TimeLine", "Settings"];
    List<Icon> icons = [
      Icon(Icons.home),
      Icon(Icons.timeline),
      Icon(Icons.settings),
    ];
    List<Widget> pages = [NoteList(), TimeLine(), Settings()]; //追加
    final page_state = useState(0);
    List<BottomNavigationBarItem> navi_items = [];
    for (int i = 0; i < keys.length; i++) {
      navi_items.add(BottomNavigationBarItem(
        icon: icons[i],
        label: keys[i],
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(keys[page_state.value]),
      ),
      body: pages[page_state.value], //変更
      bottomNavigationBar: BottomNavigationBar(
        items: navi_items,
        currentIndex: page_state.value,
        onTap: (index) {
          page_state.value = index;
        },
      ),
    );
  }
}
