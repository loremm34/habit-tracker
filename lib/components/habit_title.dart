import 'package:flutter/material.dart';

class HabitTitle extends StatelessWidget {
  HabitTitle(
      {super.key,
      required this.habitName,
      required this.habitCompleted,
      required this.onChanged});

  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Checkbox(value: habitCompleted, onChanged: onChanged),
            Text(habitName),
          ],
        ),
      ),
    );
  }
}
