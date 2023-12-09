import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:frontend/src/common/theme/text/app_typography.dart';

import '../common/theme/border_radius/border_radius.dart';
import '../common/theme/colors/app_palette.dart';

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
  final List<StockData> real;
  final List<StockData> predicted;

  const GraphWidget({
    Key? key,
    required this.title,
    required this.real,
    required this.predicted,
  }) : super(key: key);

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  GraphType type = GraphType.day;

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    // Customize your widget here for the Y-axis
    if (value - value.floor() < 0.01) {
      return Text(
        value.toString(),
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF14161C),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // Customize your widget here for the X-axis
    if (value - value.floor() < 0.01)
      return Text(
        '${value.toString()}:00',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF14161C),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
    return SizedBox.shrink();
  }

  double getMinY() {
    double min = double.infinity;
    for (var element in widget.real) {
      if (element.pointY < min) {
        min = element.pointY;
      }
    }
    for (var element in widget.predicted) {
      if (element.pointY < min) {
        min = element.pointY;
      }
    }

    return max(min - 100, 0);
  }

  double getMaxY() {
    double max = 0;
    for (var element in widget.real) {
      if (element.pointY > max) {
        max = element.pointY;
      }
    }
    for (var element in widget.predicted) {
      if (element.pointY > max) {
        max = element.pointY;
      }
    }

    return max;
  }

  double getMinX() {
    double min = double.infinity;
    for (var element in widget.real) {
      if (element.pointX < min) {
        min = element.pointX;
      }
    }
    for (var element in widget.predicted) {
      if (element.pointX < min) {
        min = element.pointX;
      }
    }

    return min;
  }

  double getMaxX() {
    double max = 0;
    for (var element in widget.real) {
      if (element.pointX > max) {
        max = element.pointX;
      }
    }
    for (var element in widget.predicted) {
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
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: type == GraphType.day ? AppPalette.mainBlue : AppPalette.greyBg,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        'ДН',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: type == GraphType.day ? Colors.white : Color(0xFF14161C),
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
                      });
                    },
                    child: Container(
                      color: type == GraphType.week ? AppPalette.mainBlue : AppPalette.greyBg,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Text(
                        'Н',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: type == GraphType.week ? Colors.white : Color(0xFF14161C),
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
                      });
                    },
                    child: Container(
                      color: type == GraphType.month ? AppPalette.mainBlue : AppPalette.greyBg,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Text(
                        'М',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: type == GraphType.month ? Colors.white : Color(0xFF14161C),
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
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: type == GraphType.halfyear ? AppPalette.mainBlue : AppPalette.greyBg,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        '6М',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: type == GraphType.halfyear ? Colors.white : Color(0xFF14161C),
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
                    return FlLine(
                      color: const Color(0xffe7e8ec),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: const Color(0xffe7e8ec),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
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
                    spots: widget.real.map((e) => FlSpot(e.pointX, e.pointY)).toList(),
                    color: Colors.blue,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    spots: [
                      FlSpot(widget.real.last.pointX, widget.real.last.pointY),
                      ...widget.predicted.map((e) => FlSpot(e.pointX, e.pointY)).toList()
                    ],
                    color: Colors.blue,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
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
