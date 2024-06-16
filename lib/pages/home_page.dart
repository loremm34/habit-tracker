import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit_title.dart';
import 'package:habit_tracker/components/my_floating_action_button.dart';
import 'package:habit_tracker/components/enter_new_habit_box.dart';

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
    ["Shower", false],
    ["Code App", false]
  ];

  void onTappedCheckBox(bool? value, int index) {
    todaysHabitList[index][1] = value;
    setState(() {});
  }

  final _newHabitNameController = TextEditingController();

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return EnterNewHabitBox(
          controller: _newHabitNameController,
          save: saveNewHabit,
          cancel: cancelNewHabit,
        );
      },
    );
  }

  void saveNewHabit() {
    todaysHabitList.add([_newHabitNameController.text, false]);
    setState(() {});
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void cancelNewHabit() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
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
