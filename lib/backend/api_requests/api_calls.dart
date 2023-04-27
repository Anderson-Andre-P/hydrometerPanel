import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start telemetryHidrometro Group Code

class TelemetryHidrometroGroup {
  static String baseUrl = 'https://monitordeenergia.ml/api';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'X-Authorization': 'Bearer [token]',
  };
  static AuthUserCall authUserCall = AuthUserCall();
  static UserLoginCall userLoginCall = UserLoginCall();
  static ConsumptionCall consumptionCall = ConsumptionCall();
  static DevicesInfosCall devicesInfosCall = DevicesInfosCall();
}

class AuthUserCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'authUser',
      apiUrl: '${TelemetryHidrometroGroup.baseUrl}/auth/user',
      callType: ApiCallType.GET,
      headers: {
        ...TelemetryHidrometroGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.firstName''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.lastName''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic customerId(dynamic response) => getJsonField(
        response,
        r'''$.customerId.id''',
      );
}

class UserLoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "username": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'userLogin',
      apiUrl: '${TelemetryHidrometroGroup.baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {
        ...TelemetryHidrometroGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  dynamic refreshToken(dynamic response) => getJsonField(
        response,
        r'''$.refreshToken''',
      );
}

class ConsumptionCall {
  Future<ApiCallResponse> call({
    String? deviceCustomerId = '',
    String? startTs = '',
    String? endTs = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'consumption',
      apiUrl:
          '${TelemetryHidrometroGroup.baseUrl}/plugins/telemetry/DEVICE/${deviceCustomerId}/values/timeseries?keys=hidrometro&startTs=${startTs}&endTs=${endTs}&limit=1&orderBy=ASC',
      callType: ApiCallType.GET,
      headers: {
        ...TelemetryHidrometroGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic hidrometroValue(dynamic response) => getJsonField(
        response,
        r'''$.hidrometro[:].value''',
        true,
      );
}

class DevicesInfosCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'devicesInfos',
      apiUrl:
          '${TelemetryHidrometroGroup.baseUrl}/customer/${customerId}/deviceInfos?pageSize=1&page=1',
      callType: ApiCallType.GET,
      headers: {
        ...TelemetryHidrometroGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dataidid(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id.id''',
        true,
      );
}

/// End telemetryHidrometro Group Code

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{"username":"${email}", "password":"${password}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: 'https://monitordeenergia.ml/api/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  static dynamic customerId(dynamic response) => getJsonField(
        response,
        r'''$.customerid''',
      );
  static dynamic customeridID(dynamic response) => getJsonField(
        response,
        r'''$.customerid[:].id''',
      );
}

class UserCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'user',
      apiUrl: 'https://monitordeenergia.ml/api/auth/user',
      callType: ApiCallType.GET,
      headers: {
        'X-Authorization': 'Bearer ${token}',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.firstName''',
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
}

class ConsumptionTesteCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'consumptionTeste',
      apiUrl:
          'https://monitordeenergia.ml/api/plugins/telemetry/DEVICE/672353b0-7508-11ed-bea8-6b625260d548/values/timeseries?keys=hidrometro&startTs=1646092800000&endTs=1680307200000&limit=1&orderBy=ASC',
      callType: ApiCallType.GET,
      headers: {
        'X-Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic hidroValue(dynamic response) => getJsonField(
        response,
        r'''$.hidrometro[0].value''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
