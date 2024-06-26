import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Говорим что будем использовать hive
  Hive.initFlutter();

  // открываем котнейнер для хранения данных
  await Hive.openBox("Habit_Database");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      theme: ThemeData(primaryColor: Colors.green),
      debugShowCheckedModeBanner: false,
    );
  }
}
