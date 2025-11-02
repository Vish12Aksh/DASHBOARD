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
      PerformanceData(2020, 50),
    ];

    final projectDone = [
      PerformanceData(2015, 20),
      PerformanceData(2016, 25),
      PerformanceData(2017, 48),
      PerformanceData(2018, 40),
      PerformanceData(2019, 45),
      PerformanceData(2020, 40),
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
                  _LegendItem(color: Color(0xFFF67979), label: 'Pending\nDone'),
                  SizedBox(width: 20),
                  _LegendItem(color: Color(0xFF750E9E), label: 'Project\nDone'),
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
                maxY: 55,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1),
                    left: BorderSide(color: Colors.grey, width: 1),
                    right: BorderSide(color: Colors.transparent),
                    top: BorderSide(color: Colors.transparent),
                  ),
                ),
                lineTouchData: LineTouchData(
                  enabled: true,
                  handleBuiltInTouches: true,
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Colors.purpleAccent,
                    tooltipRoundedRadius: 8,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((barSpot) {
                        final x = barSpot.x.toInt();
                        final y = barSpot.y.toInt();
                        return LineTooltipItem(
                          '$x  $y ',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),


                lineBarsData: [
                  // Pending Done Line
                  LineChartBarData(

                    spots: pendingDone
                        .map((data) => FlSpot(data.year.toDouble(), data.value.toDouble()))
                        .toList(),
                    isCurved: true,
                    curveSmoothness: 0.3,
                    color: Color(0xFFF67979),
                    barWidth: 4,
                    isStrokeCapRound: true,

                    dotData: FlDotData(
                      show: false,
                      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                        radius: 4,
                        color: Colors.purple,
                        strokeWidth: 0,
                        strokeColor: Colors.transparent,
                      ),
                    ),

                    shadow: Shadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ),

                  // Project Done Line
                  LineChartBarData(
                    spots: projectDone
                        .map((data) => FlSpot(data.year.toDouble(), data.value.toDouble()))
                        .toList(),
                    isCurved: true,
                    curveSmoothness: 0.3,
                    color: Color(0xFF750E9E),
                    barWidth: 4,
                    isStrokeCapRound: true,

                    dotData: FlDotData(
                      show: false,
                      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                        radius: 4,
                        color: Colors.redAccent,
                        strokeWidth: 0,
                        strokeColor: Colors.transparent,
                      ),
                    ),

                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF750E9E).withOpacity(0.5),
                          Color(0xFF750E9E).withOpacity(0.0),
                        ],
                      ),
                    ),

                    shadow: Shadow(
                      color: Colors.deepPurpleAccent.withOpacity(0.5),
                      blurRadius: 3,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.circle_rounded, color: color, size: 14),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}

