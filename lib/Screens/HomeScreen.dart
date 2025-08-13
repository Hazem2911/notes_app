import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/custom_appBar.dart';
import 'package:notes_app/Widgets/noteslistView.dart';
import 'package:notes_app/services/showModal.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xff303030),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModal(context, 'Add Note', true);
        },
        backgroundColor: const Color(0xff57edd8),
        child: const Icon(Icons.add, color: Colors.black),
      ),
      appBar: customAppBar(title: 'Notes'),
      body: const Expanded(child: NotesListView()),
    );
  }
}


