import 'dart:math';

import 'package:flutter/material.dart';

import '../../../common/strings.dart';
import '../../../widgets/graph_widget.dart';

class GraphStats extends StatelessWidget {
  const GraphStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440,
      child: GraphWidget(
        title: Strings.stats24Hours,
        realDay: List.generate(
            8,
            (index) => StockData(
                pointX: 10.0 + index,
                pointY: Random().nextDouble() * 1000 + 300)),
        predictedDay: List.generate(
            2,
            (index) => StockData(
                pointX: 18.0 + index,
                pointY: Random().nextDouble() * 1000 + 300)),
        realWeek: List.generate(
            8,
            (index) => StockData(
                pointX: index / 2, pointY: Random().nextDouble() * 1000 + 300)),
        predictedWeek: List.generate(
            2,
            (index) => StockData(
                pointX: (8 + index) / 2,
                pointY: Random().nextDouble() * 1000 + 300)),
        realMonth: List.generate(
            8,
            (index) => StockData(
                pointX: index * 2, pointY: Random().nextDouble() * 1000 + 300)),
        predictedMonth: List.generate(
            2,
            (index) => StockData(
                pointX: (8 + index) * 2,
                pointY: Random().nextDouble() * 1000 + 300)),
        realHalfYear: List.generate(
            8,
            (index) => StockData(
                pointX: index / 2, pointY: Random().nextDouble() * 1000 + 300)),
        predictedHalfYear: List.generate(
            2,
            (index) => StockData(
                pointX: (8 + index) / 2,
                pointY: Random().nextDouble() * 1000 + 300)),
      ),
    );
  }
}
