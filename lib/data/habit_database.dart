import 'package:hive_flutter/hive_flutter.dart';
import 'package:habit_tracker/datetime/date_time.dart';

final _habitDatabase = Hive.box("Habit_Database");

class HabitDatabase {
  List todaysHabitList = [];

  // создаем
  void createDefaultData() {
    todaysHabitList = [
      ["Run", false],
      ["Smth", false]
    ];

    _habitDatabase.put("START_DATE", todaysDateFormatted());
  }

  // загружаем
  void loadData() {
    if (_habitDatabase.get(todaysDateFormatted() == null)) {
      todaysHabitList = _habitDatabase.get("CURRENT_HABBIT_LIST");

      for (var i = 0; i < todaysHabitList.length; ++i) {
        todaysHabitList[i][1] = false;
      }
    } else {
      _habitDatabase.get(todaysDateFormatted());
    }
  }

  // обновляем
  void updateDatabase() {}
}
