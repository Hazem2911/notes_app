import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Modal.dart';
import 'package:notes_app/models/note_model.dart';

void showModal(
  BuildContext context,
  String text,
  bool hasButton, {
  NoteModel? note, 
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DraggableScrollableModalSheet(
        text: text,
        hasButton: hasButton,
        note: note, 
      );
    },
  );
}


