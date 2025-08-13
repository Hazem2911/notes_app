import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/services/showModal.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.color, required this.note});
  final Color color;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModal(context, 'Edit Note', false);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        height: 225,
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(fontSize: 30),
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Text(
                        note.subTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Color(0xff966e2b),
                        ),
                        maxLines: null,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 50, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).showNotes();
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 38,
                    ),
                  ),
                  Text(
                    note.date.split(' ')[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Color(0xff966e2b),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
