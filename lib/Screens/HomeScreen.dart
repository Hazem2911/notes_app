import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Clickable_Icon.dart';
import 'package:notes_app/Widgets/Note_Widget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff57edd8),
        child: Icon(Icons.add, color: Colors.black),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff303030),
        title: Text(
          'Notes',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Clickableicon(icon: Icons.search)
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            NoteWidget(color: Color(0xffffcd7a)),
            NoteWidget(color: Color(0xffe7e896)),
            NoteWidget(color: Color(0xff76d6ee)),
            NoteWidget(color: Color(0xffd49eda)),
            NoteWidget(color: Color(0xffffcd7a)),
            NoteWidget(color: Color(0xffe7e896)),
          ],
        ),
      ),
    );
  }
}
