// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;

import 'dart:convert';

Future<double> sumConsunptions(
  List<String> listOfDevices,
  String startTs,
  String endTs,
  String keys,
  String token,
) async {
  // Add your function code here!
  const String baseUrl = 'https://monitordeenergia.ml/api';
  const String keys = 'hidrometro';
  double sum = 0.0;

  try {
    final List<Future<http.Response>> futures = [];

    for (int i = 0; i < listOfDevices.length; i++) {
      final String entityId = listOfDevices[i];

      final url = '$baseUrl' +
          '/plugins/telemetry/DEVICE/' +
          '$entityId' +
          '/values/timeseries?keys=' +
          '$keys' +
          '&startTs=' +
          '$startTs' +
          '&endTs=' +
          '$endTs' +
          '&limit=1&agg=NONE&orderBy=ASC';

      final future = http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );
      futures.add(future);
    }

    final List<http.Response> responses = await Future.wait(futures);

    for (int i = 0; i < responses.length; i++) {
      final response = responses[i];

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final value = jsonResponse['hidrometro'][0]['value'];
        sum += double.parse(value);
      } else {
        print('Erro ao fazer a requisição: ${response.statusCode}');
      }
    }
  } catch (e) {
    print('Erro ao fazer a requisição: $e');
  }

  return sum;
}
