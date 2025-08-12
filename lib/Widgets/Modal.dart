import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/Clickable_Icon.dart';
import 'package:notes_app/Widgets/editNote_bar.dart';

class DraggableScrollableModalSheet extends StatelessWidget {
  const DraggableScrollableModalSheet({
    super.key,
    required this.text,
    required this.hasButton,
  });
  final String text;
  final bool hasButton;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
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
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
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
              ),
              if (hasButton)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff53ebd6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
