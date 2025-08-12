import 'package:flutter/material.dart';

class EditForm extends StatelessWidget {
  const EditForm({
    Key? key,
    required this.label,
    required this.hint,
    required this.vertical,
  }) : super(key: key);
  final String label;
  final String hint;
  final double vertical;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white), // <-- Add this line
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
        labelText: label,
        labelStyle: const TextStyle(fontSize: 20, color: Color(0xff7addcb)),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
