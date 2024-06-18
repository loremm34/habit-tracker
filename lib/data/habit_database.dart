import 'package:hive_flutter/hive_flutter.dart';

class HabitDatabase {
  List todaysHabitList = [];

  // создаем
  void createDefaultData() {
    todaysHabitList = [
      ["Run", false],
      ["Smth", false]
    ];
  }

  // загружаем
  void loadData() {}
  // обновляем
  void updateDatabase() {}
}
