import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _lstoken = await secureStorage.getString('ff_lstoken') ?? _lstoken;
    _lsrefreshtoken =
        await secureStorage.getString('ff_lsrefreshtoken') ?? _lsrefreshtoken;
    _lsname = await secureStorage.getString('ff_lsname') ?? _lsname;
    _lscustomerid =
        await secureStorage.getString('ff_lscustomerid') ?? _lscustomerid;
    _deviceCustomerId = await secureStorage.getString('ff_deviceCustomerId') ??
        _deviceCustomerId;
    _startTs = await secureStorage.getString('ff_startTs') ?? _startTs;
    _endTs = await secureStorage.getString('ff_endTs') ?? _endTs;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _lstoken = '';
  String get lstoken => _lstoken;
  set lstoken(String _value) {
    _lstoken = _value;
    secureStorage.setString('ff_lstoken', _value);
  }

  void deleteLstoken() {
    secureStorage.delete(key: 'ff_lstoken');
  }

  String _lsrefreshtoken = '';
  String get lsrefreshtoken => _lsrefreshtoken;
  set lsrefreshtoken(String _value) {
    _lsrefreshtoken = _value;
    secureStorage.setString('ff_lsrefreshtoken', _value);
  }

  void deleteLsrefreshtoken() {
    secureStorage.delete(key: 'ff_lsrefreshtoken');
  }

  String _lsname = '';
  String get lsname => _lsname;
  set lsname(String _value) {
    _lsname = _value;
    secureStorage.setString('ff_lsname', _value);
  }

  void deleteLsname() {
    secureStorage.delete(key: 'ff_lsname');
  }

  String _lscustomerid = '';
  String get lscustomerid => _lscustomerid;
  set lscustomerid(String _value) {
    _lscustomerid = _value;
    secureStorage.setString('ff_lscustomerid', _value);
  }

  void deleteLscustomerid() {
    secureStorage.delete(key: 'ff_lscustomerid');
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;
  set isDarkTheme(bool _value) {
    _isDarkTheme = _value;
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String _value) {
    _deviceId = _value;
  }

  String _deviceCustomerId = '';
  String get deviceCustomerId => _deviceCustomerId;
  set deviceCustomerId(String _value) {
    _deviceCustomerId = _value;
    secureStorage.setString('ff_deviceCustomerId', _value);
  }

  void deleteDeviceCustomerId() {
    secureStorage.delete(key: 'ff_deviceCustomerId');
  }

  String _startTs = '1646092800000';
  String get startTs => _startTs;
  set startTs(String _value) {
    _startTs = _value;
    secureStorage.setString('ff_startTs', _value);
  }

  void deleteStartTs() {
    secureStorage.delete(key: 'ff_startTs');
  }

  String _endTs = '1680307200000';
  String get endTs => _endTs;
  set endTs(String _value) {
    _endTs = _value;
    secureStorage.setString('ff_endTs', _value);
  }

  void deleteEndTs() {
    secureStorage.delete(key: 'ff_endTs');
  }

  bool _debugComponent = false;
  bool get debugComponent => _debugComponent;
  set debugComponent(bool _value) {
    _debugComponent = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
