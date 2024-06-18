import 'package:hive_flutter/hive_flutter.dart';

final _habitDatabase = Hive.box("Habit_Database");

class HabitDatabase {
  List todaysHabitList = [];

  // создаем
  void createDefaultData() {}
  // загружаем
  void loadData() {}
  // обновляем
  void updateDatabase() {}
}
