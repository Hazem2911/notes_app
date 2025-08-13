import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class EditForm extends StatelessWidget {
  const EditForm({
    Key? key,
    required this.label,
    required this.hint,
    required this.vertical,
    this.onSaved,
    this.controller, this.onChanged,
  }) : super(key: key);
  final String label;
  final String hint;
  final double vertical;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This Field is Required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      style: const TextStyle(color: Colors.white),
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
          borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ), // Full red border for errors
        ),
        labelText: label,
        labelStyle: const TextStyle(fontSize: 20, color: kPrimaryColor),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.blueGrey),
      ),
    );
  }
}
