import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Widgets/Note_Widget.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

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
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteWidget(color: colors[index % colors.length], note: notes[index],);
            },
          ),
        );
      },
    );
  }
}
