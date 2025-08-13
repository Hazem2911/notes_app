import 'package:flutter/material.dart';

class Clickableicon extends StatelessWidget {
  const Clickableicon({super.key, required this.icon,  this.onTap});
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff3a3a3a),
          borderRadius: BorderRadius.circular(15),
        ),
        width: 50,
        height: 50,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
