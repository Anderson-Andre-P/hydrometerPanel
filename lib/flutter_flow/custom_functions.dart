import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

String mesatual() {
  DateTime today = DateTime.now();
  /*DateTime data_desejada = DateTime(today.year,today.month,today.day,today.hour,today.minute,today.second,today.millisecond,today.microsecond);*/
  DateTime mes_atual = DateTime(today.year, today.month);
  String dataFormatada =
      mes_atual.millisecondsSinceEpoch.toString().substring(0, 13);
  /*String dataFormatada =
      DateTime.now().millisecondsSinceEpoch.toString().substring(0, 10);*/
  return dataFormatada;
}

String mesanterior() {
  DateTime today = DateTime.now();
  /*DateTime data_desejada = DateTime(today.year,today.month,today.day,today.hour,today.minute,today.second,today.millisecond,today.microsecond);*/
  DateTime mes_anterior = DateTime(today.year, today.month - 1);
  String dataFormatada =
      mes_anterior.millisecondsSinceEpoch.toString().substring(0, 13);
  /*String dataFormatada =
      DateTime.now().millisecondsSinceEpoch.toString().substring(0, 10);*/
  return dataFormatada;
}

String horaatual() {
  DateTime today = DateTime.now();

  String dataFormatada =
      today.millisecondsSinceEpoch.toString().substring(0, 13);
  /*String dataFormatada =
      DateTime.now().millisecondsSinceEpoch.toString().substring(0, 10);*/
  return dataFormatada;
}

String diaatual() {
  DateTime today = DateTime.now();
  /*DateTime data_desejada = DateTime(today.year,today.month,today.day,today.hour,today.minute,today.second,today.millisecond,today.microsecond);*/
  DateTime dia_atual = DateTime(today.year, today.month, today.day);
  String dataFormatada =
      dia_atual.millisecondsSinceEpoch.toString().substring(0, 13);
  /*String dataFormatada =
      DateTime.now().millisecondsSinceEpoch.toString().substring(0, 10);*/
  return dataFormatada;
}

String? consumodiaatual(
  String? consumoatual,
  String? consumoiniciodia,
) {
  // convert 2 strings to double and subtract
  double _dConsumoAtual;
  double _dConsumoInicioDia;

  if (consumoatual != null && !consumoatual.isEmpty)
    _dConsumoAtual = double.parse(consumoatual);
  else
    _dConsumoAtual = 0.0;

  if (consumoiniciodia != null && !consumoiniciodia.isEmpty)
    _dConsumoInicioDia = double.parse(consumoiniciodia);
  else
    _dConsumoInicioDia = 0.0;

  double _dConsumoFinal = _dConsumoAtual - _dConsumoInicioDia;

  return _dConsumoFinal.toStringAsFixed(0);
}

String? somah1h2h3(
  String? hidrometro1,
  String? hidrometro2,
  String? hidrometro3,
) {
  // convert 3 strings to double and sum
  double hidrometro1Double = 0.0;
  double hidrometro2Double = 0.0;
  double hidrometro3Double = 0.0;

  double hidrometroTotal = 0.0;

  try {
    hidrometro1Double = double.parse(hidrometro1 ?? "");
    hidrometro2Double = double.parse(hidrometro2 ?? "");
    hidrometro3Double = double.parse(hidrometro3 ?? "");

    hidrometroTotal = hidrometro1Double + hidrometro2Double + hidrometro3Double;

    return /*"Hidrometro total: " + */ hidrometroTotal.toStringAsFixed(0);
  } on Exception {
    return null;
  }
}
