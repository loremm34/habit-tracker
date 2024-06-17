import 'package:flutter/material.dart';

class DialogHabitBox extends StatelessWidget {
  DialogHabitBox(
      {super.key,
      required this.controller,
      required this.save,
      required this.cancel,
      required this.hintText});

  final controller;
  final void Function() save;
  final void Function() cancel;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: cancel,
          color: Colors.black,
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          onPressed: save,
          color: Colors.black,
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
