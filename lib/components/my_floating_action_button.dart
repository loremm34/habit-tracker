import "package:flutter/material.dart";

class MyFloatingActionButton extends StatelessWidget {
  MyFloatingActionButton({super.key, required this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}
