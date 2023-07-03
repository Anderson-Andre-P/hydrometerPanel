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

Future sumTimeseriesConsunptionsByAsset(
  String assetId,
  String startTs,
  String endTs,
  String token,
  List<String> keys,
) async {
  // Add your function code here!
  const String baseUrl = 'https://monitordeenergia.ml/api';
  double sum = 0.0;

  try {
    final url_one = '$baseUrl/plugins/telemetry/ASSET/$assetId/keys/timeseries';

    final response = await http.get(
      Uri.parse(url_one),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final vetor = jsonDecode(response.body);

      int contador = 0;
      for (var elemento in vetor) {
        if (elemento.startsWith("apt_")) {
          contador++;
        }
      }

      print("Quantidade de valores que começam com 'apt_': $contador");
    } else {
      print("Erro ao fazer a requisição à API: ${response.statusCode}");
    }
  } catch (e) {
    print('Erro ao fazer a requisição: $e');
  }

  try {
    final url =
        '$baseUrl/plugins/telemetry/ASSET/$assetId/values/timeseries?&startTs=$startTs&endTs=$endTs&limit=1&agg=NONE&orderBy=ASC';

    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      jsonResponse.keys.forEach((key) {
        if (key.startsWith('apt_')) {
          final values = jsonResponse[key] as List<dynamic>;
          if (values.isNotEmpty) {
            final value = values[0]['value'];
            final doubleParsed = double.tryParse(value) ?? 0.0;
            sum += doubleParsed;
            print('Valor de $key: $value');
          }
        }
      });
    }
  } catch (e) {
    print('Erro ao fazer a requisição: $e');
  }
  print('Soma total: $sum');
  return sum;
}
