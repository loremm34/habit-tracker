import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  List todaysHabitList = [
    ["Morning run", false],
    ["Shower", false]
  ];

  void onTappedCheckBox(bool? value, int index) {
    todaysHabitList[index][1] = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
        itemCount: todaysHabitList.length,
        itemBuilder: (context, index) {
          return HabitTitle(
              habitName: todaysHabitList[index][0],
              habitCompleted: todaysHabitList[index][1],
              onChanged: (value) => onTappedCheckBox(value, index));
        },
      ),
    );
  }
}
