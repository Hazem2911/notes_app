import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Clickable_Icon.dart';
import 'package:notes_app/Widgets/editNote_bar.dart';

void showModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 0.8,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Color(0xff303030),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: ListView(
              controller: scrollController,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Edit Note',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Clickableicon(icon: Icons.check),
                      ],
                    ),
                    const SizedBox(height: 15),
                    EditForm(
                      label: 'Title',
                      hint: 'Enter Note\'s Title',
                      vertical: 25,
                    ),
                    const SizedBox(height: 25),
                    EditForm(label: 'Content', hint: '', vertical: 75),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
