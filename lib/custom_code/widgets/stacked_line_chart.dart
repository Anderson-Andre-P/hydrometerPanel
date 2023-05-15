// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StackedLineChart extends StatefulWidget {
  const StackedLineChart({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _StackedLineChartState createState() => _StackedLineChartState();
}

class _StackedLineChartState extends State<StackedLineChart> {
  late List<ConsunptionData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _chartData = getChartData(365);
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );

    _zoomPanBehavior = ZoomPanBehavior(
      zoomMode: ZoomMode.x,
      enablePinching: true,
      enablePanning: true,
      enableSelectionZooming: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RangeController rangeController = RangeController(
      start: calculateTimestampFromFiftenDaysAgo(),
      end: currentDay(),
    );

    return Center(
      child: SfCartesianChart(
        zoomPanBehavior: _zoomPanBehavior,
        primaryXAxis: DateTimeAxis(
          autoScrollingMode: AutoScrollingMode.start,
          autoScrollingDeltaType: DateTimeIntervalType.days,
          visibleMinimum: calculateTimestampFromFiftenDaysAgo(),
          visibleMaximum: rangeController.end,
          minimum: firstConsumptionMeasurement(),
          maximum: currentDay(),
        ),
        palette: <Color>[
          FlutterFlowTheme.of(context).primary,
        ],
        legend: Legend(
          isVisible: true,
          isResponsive: true,
          position: LegendPosition.bottom,
        ),
        enableAxisAnimation: true,
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          StackedColumnSeries<ConsunptionData, DateTime>(
            animationDuration: 3000,
            animationDelay: 1000,
            trendlines: <Trendline>[
              Trendline(
                type: TrendlineType.linear,
                color: FlutterFlowTheme.of(context).error,
              )
            ],
            dataSource: _chartData,
            xValueMapper: (ConsunptionData exp, _) => exp.date,
            yValueMapper: (ConsunptionData exp, _) => exp.consunption,
            emptyPointSettings: EmptyPointSettings(
              mode: EmptyPointMode.average,
            ),
            name: 'Consumo',
            markerSettings: MarkerSettings(
              isVisible: false,
            ),
          ),
        ],
      ),
    );
  }
}

// List<ConsunptionData> getChartData() {
//   final List<ConsunptionData> chartData = [
//     ConsunptionData(DateTime(2023, 2, 1), 55),
//   ];
//   return chartData;
// }

List<ConsunptionData> getChartData(int numberOfDates) {
  final List<ConsunptionData> chartData = [];

  final random = Random();

  for (int i = 0; i < numberOfDates; i++) {
    final date =
        DateTime(2023, 1, 1, 00, 00, 00, 000000).add(Duration(days: i));
    final consunption = random.nextInt(21) + 45;
    chartData.add(ConsunptionData(date, consunption));
  }

  return chartData;
}

class ConsunptionData {
  ConsunptionData(this.date, this.consunption);
  final DateTime date;
  final int? consunption;
}
