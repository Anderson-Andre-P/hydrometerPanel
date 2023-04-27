// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatefulWidget {
  const RadialGauge(
      {Key? key,
      this.width,
      this.height,
      required this.lowConsumptionColor,
      required this.averageConsumptionColor,
      required this.highConsumptionColor,
      required this.consumption})
      : super(key: key);

  final double? width;
  final double? height;
  final String consumption;
  final Color lowConsumptionColor;
  final Color averageConsumptionColor;
  final Color highConsumptionColor;

  @override
  _RadialGaugeState createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 0,
          maximum: 150,
          radiusFactor: 0.9,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 90,
              color: widget.lowConsumptionColor,
              // Added range label
              label: 'Baixo',
              sizeUnit: GaugeSizeUnit.factor,
              labelStyle: GaugeTextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
              ),
              startWidth: 0.65,
              endWidth: 0.65,
            ),
            GaugeRange(
              startValue: 90,
              endValue: 125,
              color: widget.averageConsumptionColor,
              // Added range label
              label: 'Moderado',
              labelStyle: GaugeTextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
              ),
              startWidth: 0.65,
              endWidth: 0.65,
              sizeUnit: GaugeSizeUnit.factor,
            ),
            GaugeRange(
              startValue: 125,
              endValue: 150,
              color: widget.highConsumptionColor,
              // Added range label
              label: 'Alto',
              labelStyle: GaugeTextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
              ),
              sizeUnit: GaugeSizeUnit.factor,
              startWidth: 0.65,
              endWidth: 0.65,
            ),
            // Added small height range in bottom to show shadow effect.
            GaugeRange(
              startValue: 0,
              endValue: 99,
              color: Color.fromARGB(0, 255, 255, 255),
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: 90,
              lengthUnit: GaugeSizeUnit.factor,
              needleLength: 0.8,
              needleEndWidth: 11,
              tailStyle: TailStyle(
                length: 0.2,
                width: 11,
                gradient: LinearGradient(colors: <Color>[
                  Color(0xFFFF6B78),
                  Color(0xFFFF6B78),
                  Color(0xFFE20A22),
                  Color(0xFFE20A22)
                ], stops: <double>[
                  0,
                  0.5,
                  0.5,
                  1
                ]),
              ),
              gradient: LinearGradient(colors: <Color>[
                Color(0xFFFF6B78),
                Color(0xFFFF6B78),
                Color(0xFFE20A22),
                Color(0xFFE20A22)
              ], stops: <double>[
                0,
                0.5,
                0.5,
                1
              ]),
              needleColor: Color(0xFFF67280),
              knobStyle: KnobStyle(
                  knobRadius: 0.08,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: Colors.black),
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Container(
                child: Text(
                  widget.consumption,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        )
      ],
    );
  }
}
