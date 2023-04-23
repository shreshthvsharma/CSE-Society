import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SuggestedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placement Statistics'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: PieChart(
            dataMap: {
              "A": 30,
              "B": 20,
              "C": 15,
              "D": 35,
            },
            colorList: [Colors.red, Colors.green, Colors.blue, Colors.yellow],
            chartType: ChartType.ring,
            ringStrokeWidth: 32,
            centerText: "Example",
          ),
        ),
      ),
    );
  }
}
