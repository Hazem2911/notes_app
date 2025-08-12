import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Clickable_Icon.dart';

PreferredSizeWidget customAppBar({required String title, List<Widget>? actions}) {
  return AppBar(
    backgroundColor: const Color(0xff303030),
    title: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 30),
    ),
    actions: actions ??
        [
          const Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Clickableicon(icon: Icons.search),
          ),
        ],
  );
}