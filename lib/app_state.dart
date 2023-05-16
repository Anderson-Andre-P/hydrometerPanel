import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

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
    _lastValueHydrometer =
        await secureStorage.getString('ff_lastValueHydrometer') ??
            _lastValueHydrometer;
    _email = await secureStorage.getString('ff_email') ?? _email;
    _password = await secureStorage.getString('ff_password') ?? _password;
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

  String _startTs = '';
  String get startTs => _startTs;
  set startTs(String _value) {
    _startTs = _value;
    secureStorage.setString('ff_startTs', _value);
  }

  void deleteStartTs() {
    secureStorage.delete(key: 'ff_startTs');
  }

  String _endTs = '';
  String get endTs => _endTs;
  set endTs(String _value) {
    _endTs = _value;
    secureStorage.setString('ff_endTs', _value);
  }

  void deleteEndTs() {
    secureStorage.delete(key: 'ff_endTs');
  }

  String _lastValueHydrometer = '';
  String get lastValueHydrometer => _lastValueHydrometer;
  set lastValueHydrometer(String _value) {
    _lastValueHydrometer = _value;
    secureStorage.setString('ff_lastValueHydrometer', _value);
  }

  void deleteLastValueHydrometer() {
    secureStorage.delete(key: 'ff_lastValueHydrometer');
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    secureStorage.setString('ff_email', _value);
  }

  void deleteEmail() {
    secureStorage.delete(key: 'ff_email');
  }

  String _password = '';
  String get password => _password;
  set password(String _value) {
    _password = _value;
    secureStorage.setString('ff_password', _value);
  }

  void deletePassword() {
    secureStorage.delete(key: 'ff_password');
  }

  bool _apiLoaded = false;
  bool get apiLoaded => _apiLoaded;
  set apiLoaded(bool _value) {
    _apiLoaded = _value;
  }

  List<DateTime> _datePicked = [];
  List<DateTime> get datePicked => _datePicked;
  set datePicked(List<DateTime> _value) {
    _datePicked = _value;
  }

  void addToDatePicked(DateTime _value) {
    _datePicked.add(_value);
  }

  void removeFromDatePicked(DateTime _value) {
    _datePicked.remove(_value);
  }

  void removeAtIndexFromDatePicked(int _index) {
    _datePicked.removeAt(_index);
  }

  String _datePickedString = 'sem data';
  String get datePickedString => _datePickedString;
  set datePickedString(String _value) {
    _datePickedString = _value;
  }

  int _activeTab = 0;
  int get activeTab => _activeTab;
  set activeTab(int _value) {
    _activeTab = _value;
  }

  bool _userWantToLeave = false;
  bool get userWantToLeave => _userWantToLeave;
  set userWantToLeave(bool _value) {
    _userWantToLeave = _value;
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
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

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
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
