// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatefulWidget {
  DatePicker({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _DatePickerState createState() => _DatePickerState();

  DateRangePickerController _datePickerController = DateRangePickerController();
}

class _DatePickerState extends State<DatePicker> {
  get _datePickerController => null;
  bool pickedDate = false;
  List<PickerDateRange>? data;

  get actionButtons => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.multiRange,
            showActionButtons: true,
            controller: _datePickerController,
            onSubmit: (value) {
              setState(() {
                pickedDate = true;
                data = value as List<PickerDateRange>?;
                FFAppState().datePickedString = '$data';
              });
              // print(FFAppState().datePickedString);
              print(FFAppState().datePickedString);
              // print(value);
            },
            onCancel: () {
              setState(() {
                _datePickerController.selectedRanges = null;
                pickedDate = false;
                FFAppState().datePickedString =
                    'Data cancelada data selecionada';
              });
              print("Date picker canceled");
            },
          ),
        ),
        (pickedDate)
            ? Text(FFAppState().datePickedString)
            : Text("Nenhuma data selecionada"),
      ],
    );
  }
}
