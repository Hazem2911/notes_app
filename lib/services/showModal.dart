import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Modal.dart';

void showModal(BuildContext context, final String text, final bool hasButton) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DraggableScrollableModalSheet(text: text, hasButton: hasButton);
    },
  );
}

