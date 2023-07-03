import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? calculateTimestampFromNow() {
  const int THREE_HOURS_IN_MILLISECONDS = 10800000;
  final DateTime currentDate = DateTime.now();
  final int currentTimestamp = currentDate.millisecondsSinceEpoch;
  final int timestampUpdated = currentTimestamp + THREE_HOURS_IN_MILLISECONDS;

  final String timestampNow = "$timestampUpdated";

  return timestampNow;
}

String twentyMinutesAgo() {
  const int TWENTY_MINUTES_TO_MILLISECONDS =
      60 * 1000 * 60; // vinte minutos em timestamp

  final DateTime currentDate = DateTime.now();

  int currentTimestamp = currentDate.millisecondsSinceEpoch;

  int convertingTimeToMilliseconds =
      currentTimestamp - TWENTY_MINUTES_TO_MILLISECONDS;

  final String twentyMinutesAgoInString = "$convertingTimeToMilliseconds";
  // print(twentyMinutesAgoInString);
  return twentyMinutesAgoInString;
}

double? waterConsunption(String? consunption) {
  final double parsedConsunption = double.parse(consunption!);

  return parsedConsunption;
}

DateTime? firstConsumptionMeasurement() {
  const int TIMESTAMP_OF_THE_FIRST_CONSUMPTION_MEASUREMENT = 1671220584672;
  final DateTime dateOfFirstConsumptionMeasurement =
      DateTime.fromMillisecondsSinceEpoch(
          TIMESTAMP_OF_THE_FIRST_CONSUMPTION_MEASUREMENT);
  return dateOfFirstConsumptionMeasurement;
}

DateTime? currentDay() {
  DateTime today = DateTime.now();
  DateTime currentDate = DateTime(today.year, today.month, today.day);
  return currentDate;
}

double calculateWaterExpense(
  double consunption,
  String price,
) {
  final double parsedPrice = double.parse(price);
  final double consunptionExpense = consunption * parsedPrice;
  // print("parsedConsunption: " + "$parsedConsunption");
  // print("parsedPrice: " + "$parsedPrice");
  // print("consunptionExpense: " + "$consunptionExpense");
  return consunptionExpense;
}

String calculateMilliseconds(int numberOfDays) {
  const int THREE_HOURS_IN_MILLISECONDS = 10800000;
  const int NUMBER_OF_HOURS_IN_A_DAY = 24;
  const int NUMBER_OF_MINUTES_IN_AN_HOUR = 60;
  const int NUMBER_OF_SECONDS_IN_AN_MINUTE = 60;
  const int NUMBER_OF_MILLISECONDS_IN_AN_SECOND = 1000;

  final int timestampInMilliseconds = (numberOfDays *
      NUMBER_OF_HOURS_IN_A_DAY *
      NUMBER_OF_MINUTES_IN_AN_HOUR *
      NUMBER_OF_SECONDS_IN_AN_MINUTE *
      NUMBER_OF_MILLISECONDS_IN_AN_SECOND);

  final DateTime currentDate = DateTime.now();

  int currentTimestamp = currentDate.millisecondsSinceEpoch;

  final int convertingTimeToMilliseconds =
      currentTimestamp - timestampInMilliseconds;

  final String oneDayAgo = "$convertingTimeToMilliseconds";

  return oneDayAgo;
}

double? consunptionInLastDay(String? consunption) {
  final double parsedConsunption = double.parse(consunption!);

  return parsedConsunption;
}

double? calculateTotalConsunption(List<String> listaDeIds) {
  return 0;
}

int getFirstDayOfCurrentMonth() {
  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime(now.year, now.month, 1, 0, 0, 0);
  int timestamp = firstDayOfMonth.millisecondsSinceEpoch;
  print(timestamp);
  return timestamp;
}

String getFirstDateTimestamp(String type) {
  DateTime now = DateTime.now();
  DateTime? firstDay;
  int timestamp;

  switch (type) {
    case "day":
      firstDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
      break;

    case "week":
      int dayOfWeek = now.weekday;
      firstDay = now.subtract(Duration(days: dayOfWeek - 1)).subtract(Duration(
          hours: now.hour,
          minutes: now.minute,
          seconds: now.second,
          milliseconds: now.millisecond,
          microseconds: now.microsecond));
      break;

    case "month":
      firstDay = DateTime(now.year, now.month, 1, 0, 0, 0);
      break;

    case "year":
      firstDay = DateTime(now.year, 1, 1, 0, 0, 0);
      break;

    case "custom":
      // Insira aqui a lógica para lidar com o caso "custom"
      break;
  }

  if (firstDay != null) {
    timestamp = firstDay.millisecondsSinceEpoch;
  } else {
    return "Invalid type";
  }

  String timestampString = timestamp.toString();
  // print(timestamp);
  return timestampString;
}
