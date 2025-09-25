import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PerformanceData {
  final int year;
  final int value;

  PerformanceData(this.year, this.value);
}

class PerformanceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final pendingDone = [
      PerformanceData(2015, 30),
      PerformanceData(2016, 40),
      PerformanceData(2017, 35),
      PerformanceData(2018, 50),
      PerformanceData(2019, 45),
      PerformanceData(2020, 48),
    ];

    final projectDone = [
      PerformanceData(2015, 20),
      PerformanceData(2016, 25),
      PerformanceData(2017, 48),
      PerformanceData(2018, 40),
      PerformanceData(2019, 45),
      PerformanceData(2020, 50),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Over All Performance\nThe Years',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  _LegendItem(color: Colors.red, label: 'Pending'),
                  SizedBox(width: 20),
                  _LegendItem(color: Colors.blue, label: 'Project'),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 2015,
                maxX: 2020,
                minY: 0,
                maxY: 50,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(value.toInt().toString(), style: const TextStyle(fontSize: 10)),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(value.toInt().toString(), style: const TextStyle(fontSize: 10));
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: false,
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1),
                    left: BorderSide(color: Colors.grey, width: 1),
                    right: BorderSide(color: Colors.transparent),
                    top: BorderSide(color: Colors.transparent),
                  ),
                ),
                lineTouchData: LineTouchData(enabled: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: pendingDone.map((data) => FlSpot(data.year.toDouble(), data.value.toDouble())).toList(),
                    isCurved: true,

                    curveSmoothness: 0.3,
                    color: Colors.red,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),

                    shadow: Shadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ),
                  LineChartBarData(
                    spots: projectDone.map((data) => FlSpot(data.year.toDouble(), data.value.toDouble())).toList(),
                    isCurved: true,

                    curveSmoothness: 0.3,
                    color: Colors.blue,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),

                    //shadow
                    shadow: Shadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

