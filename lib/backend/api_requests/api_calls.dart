import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start hydrometerAPIEndpoints Group Code

class HydrometerAPIEndpointsGroup {
  static String baseUrl = 'https://monitordeenergia.ml/api';
  static Map<String, String> headers = {};
  static PostLoginEndpointCall postLoginEndpointCall = PostLoginEndpointCall();
  static GetTimeSeriesDataCall getTimeSeriesDataCall = GetTimeSeriesDataCall();
  static GetTimeSeriesDataByAssetCall getTimeSeriesDataByAssetCall =
      GetTimeSeriesDataByAssetCall();
  static GetLastestTimeSeriesDataCall getLastestTimeSeriesDataCall =
      GetLastestTimeSeriesDataCall();
  static GetLastestTimeSeriesDataByAssetCall
      getLastestTimeSeriesDataByAssetCall =
      GetLastestTimeSeriesDataByAssetCall();
  static GetCurrentUserCall getCurrentUserCall = GetCurrentUserCall();
  static PostLogoutCall postLogoutCall = PostLogoutCall();
  static GetCustomerDeviceInfoCall getCustomerDeviceInfoCall =
      GetCustomerDeviceInfoCall();
  static PostRefreshTokenCall postRefreshTokenCall = PostRefreshTokenCall();
  static GetAttributesCall getAttributesCall = GetAttributesCall();
  static GetCustomerAssetInfosCall getCustomerAssetInfosCall =
      GetCustomerAssetInfosCall();
}

class PostLoginEndpointCall {
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
      callName: 'postLoginEndpoint',
      apiUrl: '${HydrometerAPIEndpointsGroup.baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
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

class GetTimeSeriesDataCall {
  Future<ApiCallResponse> call({
    String? entityId = '',
    String? keys = '',
    String? startTs = '',
    String? endTs = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTimeSeriesData',
      apiUrl:
          '${HydrometerAPIEndpointsGroup.baseUrl}/plugins/telemetry/DEVICE/${entityId}/values/timeseries?keys=${keys}&startTs=${startTs}&endTs=${endTs}&orderBy=DESC',
      callType: ApiCallType.GET,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
        'X-Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic hidrometroValues(dynamic response) => getJsonField(
        response,
        r'''$.hidrometro[:].value''',
        true,
      );
  dynamic hidrometroLastValue(dynamic response) => getJsonField(
        response,
        r'''$.hidrometro[1].value''',
        true,
      );
  dynamic hidrometroFirstValue(dynamic response) => getJsonField(
        response,
        r'''$.hidrometro[-1].value''',
        true,
      );
}

class GetTimeSeriesDataByAssetCall {
  Future<ApiCallResponse> call({
    String? entityId = '',
    String? keys = '',
    String? startTs = '',
    String? endTs = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTimeSeriesDataByAsset',
      apiUrl:
          '${HydrometerAPIEndpointsGroup.baseUrl}/plugins/telemetry/ASSET/${entityId}/values/timeseries?keys=${keys}&startTs=${startTs}&endTs=${endTs}&orderBy=DESC',
      callType: ApiCallType.GET,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
        'X-Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic hidrometroValues(dynamic response) => getJsonField(
        response,
        r'''$.hidrometro[:].value''',
        true,
      );
  dynamic hidrometroLastValue(dynamic response) => getJsonField(
        response,
        r'''$.hidrometro[1].value''',
        true,
      );
  dynamic hidrometroFirstValue(dynamic response) => getJsonField(
        response,
        r'''$.hidrometro[-1].value''',
        true,
      );
}

class GetLastestTimeSeriesDataCall {
  Future<ApiCallResponse> call({
    String? entityId = '',
    String? keys = '',
    String? startTs = '',
    String? endTs = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getLastestTimeSeriesData',
      apiUrl:
          '${HydrometerAPIEndpointsGroup.baseUrl}/plugins/telemetry/DEVICE/${entityId}/values/timeseries?keys=${keys}&startTs=${startTs}&endTs=${endTs}&limit=1&agg=NONE&orderBy=ASC',
      callType: ApiCallType.GET,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
        'X-Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic hidrometroValues(dynamic response) => getJsonField(
        response,
        r'''$.hidrometro[:].value''',
        true,
      );
}

class GetLastestTimeSeriesDataByAssetCall {
  Future<ApiCallResponse> call({
    String? entityId = '',
    String? startTs = '',
    String? endTs = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getLastestTimeSeriesDataByAsset',
      apiUrl:
          '${HydrometerAPIEndpointsGroup.baseUrl}/plugins/telemetry/ASSET/${entityId}/values/timeseries?&startTs=${startTs}&endTs=${endTs}&limit=1&agg=NONE&orderBy=ASC',
      callType: ApiCallType.GET,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
        'X-Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic aptOneValue(dynamic response) => getJsonField(
        response,
        r'''$.apt_1[:].value''',
        true,
      );
}

class GetCurrentUserCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getCurrentUser',
      apiUrl: '${HydrometerAPIEndpointsGroup.baseUrl}/auth/user',
      callType: ApiCallType.GET,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
        'X-Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic customerId(dynamic response) => getJsonField(
        response,
        r'''$.customerId.id''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.firstName''',
      );
  dynamic entityIdOfTypeUser(dynamic response) => getJsonField(
        response,
        r'''$.id.id''',
      );
}

class PostLogoutCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'postLogout',
      apiUrl: '${HydrometerAPIEndpointsGroup.baseUrl}/auth/logout',
      callType: ApiCallType.POST,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
        'X-Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCustomerDeviceInfoCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getCustomerDeviceInfo',
      apiUrl:
          '${HydrometerAPIEndpointsGroup.baseUrl}/customer/${customerId}/deviceInfos?pageSize=200&page=0',
      callType: ApiCallType.GET,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
        'X-Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic entityTypeOfDeviceByCustomerId(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id.id''',
        true,
      );
  dynamic entityTypeOfDeviceByCustomerId01(dynamic response) => getJsonField(
        response,
        r'''$.data[0:1].id.id''',
        true,
      );
  dynamic entityTypeOfDeviceByCustomerId02(dynamic response) => getJsonField(
        response,
        r'''$.data[1:2].id.id''',
        true,
      );
  dynamic entityTypeOfDeviceByCustomerId03(dynamic response) => getJsonField(
        response,
        r'''$.data[2:3].id.id''',
        true,
      );
  dynamic entityTypeOfDeviceByCustomerId04(dynamic response) => getJsonField(
        response,
        r'''$.data[3:4].id.id''',
        true,
      );
  dynamic entityLabels(dynamic response) => getJsonField(
        response,
        r'''$.data[:].label''',
        true,
      );
}

class PostRefreshTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) {
    final body = '''
{
  "refreshToken": "${refreshToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postRefreshToken',
      apiUrl: '${HydrometerAPIEndpointsGroup.baseUrl}/auth/token',
      callType: ApiCallType.POST,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
        'Content-Type': 'application/json',
        'X-Authorization': 'Bearer token',
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
}

class GetAttributesCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? entityType = '',
    String? entityId = '',
    String? keys = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getAttributes',
      apiUrl:
          '${HydrometerAPIEndpointsGroup.baseUrl}/plugins/telemetry/${entityType}/${entityId}/values/attributes?keys=${keys}',
      callType: ApiCallType.GET,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
        'X-Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic valorTarifa(dynamic response) => getJsonField(
        response,
        r'''$[:1].value''',
        true,
      );
}

class GetCustomerAssetInfosCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getCustomerAssetInfos',
      apiUrl:
          '${HydrometerAPIEndpointsGroup.baseUrl}/customer/${customerId}/assetInfos?pageSize=100&page=0',
      callType: ApiCallType.GET,
      headers: {
        ...HydrometerAPIEndpointsGroup.headers,
        'X-Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic assetId(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id.id''',
      );
}

/// End hydrometerAPIEndpoints Group Code

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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
