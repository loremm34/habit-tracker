import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_tracker/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  const MonthlySummary(
      {super.key, required this.dataset, required this.startDate});

  final Map<DateTime, int> dataset;
  final String startDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, right: 25),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        datasets: dataset,
        defaultColor: Colors.grey[200],
        scrollable: true,
        showText: true,
        showColorTip: false,
        size: 30,
        colorMode: ColorMode.color,
        colorsets: {
          1: Color.fromARGB(20, 2, 179, 8),
          2: Color.fromARGB(40, 2, 179, 8),
          3: Color.fromARGB(60, 2, 179, 8),
          4: Color.fromARGB(80, 2, 179, 8),
          5: Color.fromARGB(100, 2, 179, 8),
          6: Color.fromARGB(120, 2, 179, 8),
          7: Color.fromARGB(140, 2, 179, 8),
          8: Color.fromARGB(160, 2, 179, 8),
          9: Color.fromARGB(180, 2, 179, 8),
          10: Color.fromARGB(200, 2, 179, 8),
        },
      ),
    );
  }
}
