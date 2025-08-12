import 'package:flutter/material.dart';
import 'package:notes_app/services/showModal.dart';


class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModal(context, 'Edit Note', false);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        height: 225,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flutter tips',
                    style: TextStyle(fontSize: 30, ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Build Your Career With \nHazem Ahmed',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0xff966e2b),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 50, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.delete, color: Colors.black, size: 38),
                  ),
                  Text(
                    'Aug 10,2025',
                    style: TextStyle(
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
