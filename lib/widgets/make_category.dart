import 'package:flutter/material.dart';

class MakeCategory extends StatelessWidget {
  const MakeCategory({
    super.key,
    required this.isActive,
    required this.title,
  });

  final bool isActive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: isActive ? 3 : 2.5 / 1,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: isActive ? Colors.yellow.shade700 : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Align(
            child: Text(
              title,
              style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey.shade800,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                  fontSize: 18),
            )),
        ));
  }
}
