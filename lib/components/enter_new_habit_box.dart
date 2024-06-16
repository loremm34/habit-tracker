import 'package:flutter/material.dart';

class EnterNewHabitBox extends StatelessWidget {
  EnterNewHabitBox(
      {super.key,
      required this.controller,
      required this.save,
      required this.cancel});

  final controller;
  final void Function() save;
  final void Function() cancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
        style: TextStyle(color: Colors.white),
        controller: controller,
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
