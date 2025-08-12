import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Note_Widget.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  final colors = const [
    Color(0xffffcd7a),
    Color(0xffe7e896),
    Color(0xff76d6ee),
    Color(0xffd49eda),
    Color(0xffffcd7a),
    Color(0xffe7e896),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return NoteWidget(color: colors[index]);
        },
      ),
    );
  }
}
