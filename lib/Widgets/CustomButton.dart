import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomElevatedbutton extends StatelessWidget {
  const CustomElevatedbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {},
      child: Text('Add', style: TextStyle(color: Colors.black, fontSize: 18)),
    );
  }
}
