import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:frontend/src/common/theme/text/app_typography.dart';

import '../common/theme/border_radius/border_radius.dart';
import '../common/theme/colors/app_palette.dart';

import 'package:intl/intl.dart';

enum GraphType { day, week, month, halfyear }

class StockData {
  final double pointX;
  final double pointY;
  StockData({
    required this.pointX,
    required this.pointY,
  });
}

class GraphWidget extends StatefulWidget {
  final String title;
  final List<StockData> realDay;
  final List<StockData> predictedDay;
  final List<StockData> realWeek;
  final List<StockData> predictedWeek;
  final List<StockData> realMonth;
  final List<StockData> predictedMonth;
  final List<StockData> realHalfYear;
  final List<StockData> predictedHalfYear;

  const GraphWidget({
    Key? key,
    required this.title,
    required this.realDay,
    required this.predictedDay,
    required this.realWeek,
    required this.predictedWeek,
    required this.realMonth,
    required this.predictedMonth,
    required this.realHalfYear,
    required this.predictedHalfYear,
  }) : super(key: key);

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  GraphType type = GraphType.day;

  late List<StockData> real;
  late List<StockData> predicted;

  @override
  void initState() {
    real = widget.realDay;
    predicted = widget.predictedDay;

    super.initState();
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    // Customize your widget here for the Y-axis
    if (value - value.floor() < 0.01) {
      return Text(
        value.toString(),
        textAlign: TextAlign.right,
        style: const TextStyle(
          color: Color(0xFF14161C),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  String getXTitle(double value) {
    switch (type) {
      case GraphType.day:
        return '${value.toString()}:00';
      case GraphType.week:
        return DateFormat('EEE', 'ru').format(DateTime.utc(2023, 1, 2 + value.toInt()));
      case GraphType.month:
        return DateFormat('MMM d', 'ru').format(DateTime.utc(2023, 1, 0 + value.toInt()));
      case GraphType.halfyear:
        return DateFormat('MMM', 'ru').format(DateTime(2020, value.toInt() + 1, 1));
      default:
        return value.toString();
    }
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // Customize your widget here for the X-axis
    if (value - value.floor() < 0.01)
      return Text(
        getXTitle(value),
        textAlign: TextAlign.right,
        style: const TextStyle(
          color: Color(0xFF14161C),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
    return const SizedBox.shrink();
  }

  double getMinY() {
    double min = double.infinity;
    for (var element in real) {
      if (element.pointY < min) {
        min = element.pointY;
      }
    }
    for (var element in predicted) {
      if (element.pointY < min) {
        min = element.pointY;
      }
    }

    return max(min - 100, 0);
  }

  double getMaxY() {
    double max = 0;
    for (var element in real) {
      if (element.pointY > max) {
        max = element.pointY;
      }
    }
    for (var element in predicted) {
      if (element.pointY > max) {
        max = element.pointY;
      }
    }

    return max;
  }

  double getMinX() {
    double min = double.infinity;
    for (var element in real) {
      if (element.pointX < min) {
        min = element.pointX;
      }
    }
    for (var element in predicted) {
      if (element.pointX < min) {
        min = element.pointX;
      }
    }

    return min;
  }

  double getMaxX() {
    double max = 0;
    for (var element in real) {
      if (element.pointX > max) {
        max = element.pointX;
      }
    }
    for (var element in predicted) {
      if (element.pointX > max) {
        max = element.pointX;
      }
    }

    return max;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(largeRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: AppTypography.sectionTitle,
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        type = GraphType.day;
                        real = widget.realDay;
                        predicted = widget.predictedDay;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: type == GraphType.day ? AppPalette.mainBlue : AppPalette.greyBg,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        'ДН',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: type == GraphType.day ? Colors.white : const Color(0xFF14161C),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(width: 1),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        type = GraphType.week;
                        real = widget.realWeek;
                        predicted = widget.predictedWeek;
                      });
                    },
                    child: Container(
                      color: type == GraphType.week ? AppPalette.mainBlue : AppPalette.greyBg,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Text(
                        'Н',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: type == GraphType.week ? Colors.white : const Color(0xFF14161C),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(width: 1),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        type = GraphType.month;
                        real = widget.realMonth;
                        predicted = widget.predictedMonth;
                      });
                    },
                    child: Container(
                      color: type == GraphType.month ? AppPalette.mainBlue : AppPalette.greyBg,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Text(
                        'М',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: type == GraphType.month ? Colors.white : const Color(0xFF14161C),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(width: 1),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        type = GraphType.halfyear;
                        real = widget.realHalfYear;
                        predicted = widget.predictedHalfYear;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: type == GraphType.halfyear ? AppPalette.mainBlue : AppPalette.greyBg,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        '6М',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: type == GraphType.halfyear ? Colors.white : const Color(0xFF14161C),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 25),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  drawHorizontalLine: true,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Color(0xffe7e8ec),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return const FlLine(
                      color: Color(0xffe7e8ec),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: bottomTitleWidgets,
                      // Other styling options
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: leftTitleWidgets,
                      // Other styling options
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: getMinX(),
                maxX: getMaxX(),
                minY: getMinY(),
                maxY: getMaxY(),
                lineBarsData: [
                  LineChartBarData(
                    spots: real.map((e) => FlSpot(e.pointX, e.pointY)).toList(),
                    color: AppPalette.mainBlue,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    spots: [
                      FlSpot(real.last.pointX, real.last.pointY),
                      ...predicted.map((e) => FlSpot(e.pointX, e.pointY)).toList()
                    ],
                    color: AppPalette.mainBlue,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    dashArray: [5, 5], // This creates the dotted effect
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
