import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit_title.dart';
import 'package:habit_tracker/components/my_floating_action_button.dart';
import 'package:habit_tracker/components/dialog_habit_box.dart';
import 'package:habit_tracker/data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  HabitDatabase db = HabitDatabase();

  final _habitDatabase = Hive.box("Habit_Database");
  @override
  void initState() {
    if (_habitDatabase.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    } else {
      db.loadData();
    }

    db.updateDatabase();
  }

  void onTappedCheckBox(bool? value, int index) {
    db.todaysHabitList[index][1] = value;
    setState(() {});
  }

  final _newHabitNameController = TextEditingController();

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogHabitBox(
          controller: _newHabitNameController,
          save: saveNewHabit,
          hintText: "Enter new habit",
          cancel: cancelNewHabit,
        );
      },
    );
    db.updateDatabase();
  }

  void saveNewHabit() {
    db.todaysHabitList.add([_newHabitNameController.text, false]);

    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
    setState(() {});
  }

  void cancelNewHabit() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogHabitBox(
          controller: _newHabitNameController,
          save: () => saveExistingHabit(index),
          cancel: cancelNewHabit,
          hintText: db.todaysHabitList[index][0],
        );
      },
    );
  }

  void saveExistingHabit(int index) {
    db.todaysHabitList[index][0] = _newHabitNameController.text;
    setState(() {});
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteHabit(int index) {
    db.todaysHabitList.removeAt(index);
    setState(() {});
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
      body: ListView.builder(
        itemCount: db.todaysHabitList.length,
        itemBuilder: (context, index) {
          return HabitTitle(
            habitName: db.todaysHabitList[index][0],
            habitCompleted: db.todaysHabitList[index][1],
            onChanged: (value) => onTappedCheckBox(value, index),
            settingsTapped: (context) => openHabitSettings(index),
            deleteTapped: (context) => deleteHabit(index),
          );
        },
      ),
    );
  }
}
