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
    await _safeInitAsync(() async {
      _lstoken = await secureStorage.getString('ff_lstoken') ?? _lstoken;
    });
    await _safeInitAsync(() async {
      _lsrefreshtoken =
          await secureStorage.getString('ff_lsrefreshtoken') ?? _lsrefreshtoken;
    });
    await _safeInitAsync(() async {
      _lsname = await secureStorage.getString('ff_lsname') ?? _lsname;
    });
    await _safeInitAsync(() async {
      _lscustomerid =
          await secureStorage.getString('ff_lscustomerid') ?? _lscustomerid;
    });
    await _safeInitAsync(() async {
      _deviceCustomerId =
          await secureStorage.getString('ff_deviceCustomerId') ??
              _deviceCustomerId;
    });
    await _safeInitAsync(() async {
      _lastValueHydrometer =
          await secureStorage.getString('ff_lastValueHydrometer') ??
              _lastValueHydrometer;
    });
    await _safeInitAsync(() async {
      _email = await secureStorage.getString('ff_email') ?? _email;
    });
    await _safeInitAsync(() async {
      _password = await secureStorage.getString('ff_password') ?? _password;
    });
    await _safeInitAsync(() async {
      _tokenIsPicked =
          await secureStorage.getBool('ff_tokenIsPicked') ?? _tokenIsPicked;
    });
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

  void updateDatePickedAtIndex(
    int _index,
    DateTime Function(DateTime) updateFn,
  ) {
    _datePicked[_index] = updateFn(_datePicked[_index]);
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

  bool _tokenIsPicked = false;
  bool get tokenIsPicked => _tokenIsPicked;
  set tokenIsPicked(bool _value) {
    _tokenIsPicked = _value;
    secureStorage.setBool('ff_tokenIsPicked', _value);
  }

  void deleteTokenIsPicked() {
    secureStorage.delete(key: 'ff_tokenIsPicked');
  }

  String _startTs = '';
  String get startTs => _startTs;
  set startTs(String _value) {
    _startTs = _value;
  }

  String _endTs = '';
  String get endTs => _endTs;
  set endTs(String _value) {
    _endTs = _value;
  }

  String _consunptionFromThirtyDaysAgo = '';
  String get consunptionFromThirtyDaysAgo => _consunptionFromThirtyDaysAgo;
  set consunptionFromThirtyDaysAgo(String _value) {
    _consunptionFromThirtyDaysAgo = _value;
  }

  String _consunptionFromNow = '';
  String get consunptionFromNow => _consunptionFromNow;
  set consunptionFromNow(String _value) {
    _consunptionFromNow = _value;
  }

  String _consunptionFromSevenDaysAgo = '';
  String get consunptionFromSevenDaysAgo => _consunptionFromSevenDaysAgo;
  set consunptionFromSevenDaysAgo(String _value) {
    _consunptionFromSevenDaysAgo = _value;
  }

  String _consunptionFromOneDayAgo = '';
  String get consunptionFromOneDayAgo => _consunptionFromOneDayAgo;
  set consunptionFromOneDayAgo(String _value) {
    _consunptionFromOneDayAgo = _value;
  }

  String _responseLatestValueTestString = '';
  String get responseLatestValueTestString => _responseLatestValueTestString;
  set responseLatestValueTestString(String _value) {
    _responseLatestValueTestString = _value;
  }

  String _responseLatestValue = '';
  String get responseLatestValue => _responseLatestValue;
  set responseLatestValue(String _value) {
    _responseLatestValue = _value;
  }

  String _deviceId00 = '';
  String get deviceId00 => _deviceId00;
  set deviceId00(String _value) {
    _deviceId00 = _value;
  }

  String _deviceId01 = '';
  String get deviceId01 => _deviceId01;
  set deviceId01(String _value) {
    _deviceId01 = _value;
  }

  String _deviceId02 = '';
  String get deviceId02 => _deviceId02;
  set deviceId02(String _value) {
    _deviceId02 = _value;
  }

  String _deviceId03 = '';
  String get deviceId03 => _deviceId03;
  set deviceId03(String _value) {
    _deviceId03 = _value;
  }

  String _responseLatestValue01 = '';
  String get responseLatestValue01 => _responseLatestValue01;
  set responseLatestValue01(String _value) {
    _responseLatestValue01 = _value;
  }

  String _responseLatestValue02 = '';
  String get responseLatestValue02 => _responseLatestValue02;
  set responseLatestValue02(String _value) {
    _responseLatestValue02 = _value;
  }

  String _responseLatestValue03 = '';
  String get responseLatestValue03 => _responseLatestValue03;
  set responseLatestValue03(String _value) {
    _responseLatestValue03 = _value;
  }

  String _responseLatestValue04 = '';
  String get responseLatestValue04 => _responseLatestValue04;
  set responseLatestValue04(String _value) {
    _responseLatestValue04 = _value;
  }

  bool _apiLoadedSecondScreen = false;
  bool get apiLoadedSecondScreen => _apiLoadedSecondScreen;
  set apiLoadedSecondScreen(bool _value) {
    _apiLoadedSecondScreen = _value;
  }

  List<String> _listOfDevices = [];
  List<String> get listOfDevices => _listOfDevices;
  set listOfDevices(List<String> _value) {
    _listOfDevices = _value;
  }

  void addToListOfDevices(String _value) {
    _listOfDevices.add(_value);
  }

  void removeFromListOfDevices(String _value) {
    _listOfDevices.remove(_value);
  }

  void removeAtIndexFromListOfDevices(int _index) {
    _listOfDevices.removeAt(_index);
  }

  void updateListOfDevicesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listOfDevices[_index] = updateFn(_listOfDevices[_index]);
  }

  double _responseAPILatestValueOne = 0.0;
  double get responseAPILatestValueOne => _responseAPILatestValueOne;
  set responseAPILatestValueOne(double _value) {
    _responseAPILatestValueOne = _value;
  }

  double _responseAPILatestValueTwo = 0.0;
  double get responseAPILatestValueTwo => _responseAPILatestValueTwo;
  set responseAPILatestValueTwo(double _value) {
    _responseAPILatestValueTwo = _value;
  }

  String _assetIdResponse = '';
  String get assetIdResponse => _assetIdResponse;
  set assetIdResponse(String _value) {
    _assetIdResponse = _value;
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
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
