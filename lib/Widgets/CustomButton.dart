import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomElevatedbutton extends StatelessWidget {
  const CustomElevatedbutton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Text('Add', style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
    );
  }
}
