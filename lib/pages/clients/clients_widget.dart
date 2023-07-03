import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'clients_model.dart';
export 'clients_model.dart';

class ClientsWidget extends StatefulWidget {
  const ClientsWidget({Key? key}) : super(key: key);

  @override
  _ClientsWidgetState createState() => _ClientsWidgetState();
}

class _ClientsWidgetState extends State<ClientsWidget> {
  late ClientsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().apiLoadedSecondScreen = false;
      });
      _model.getCustomerDeviceInfoResponse =
          await HydrometerAPIEndpointsGroup.getCustomerDeviceInfoCall.call(
        customerId: FFAppState().lscustomerid,
        token: FFAppState().lstoken,
      );
      if ((_model.getCustomerDeviceInfoResponse?.succeeded ?? true)) {
        setState(() {
          FFAppState().deviceId00 = (HydrometerAPIEndpointsGroup
                  .getCustomerDeviceInfoCall
                  .entityTypeOfDeviceByCustomerId01(
            (_model.getCustomerDeviceInfoResponse?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          FFAppState().deviceId01 = (HydrometerAPIEndpointsGroup
                  .getCustomerDeviceInfoCall
                  .entityTypeOfDeviceByCustomerId02(
            (_model.getCustomerDeviceInfoResponse?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          FFAppState().deviceId02 = (HydrometerAPIEndpointsGroup
                  .getCustomerDeviceInfoCall
                  .entityTypeOfDeviceByCustomerId03(
            (_model.getCustomerDeviceInfoResponse?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          FFAppState().deviceId03 = (HydrometerAPIEndpointsGroup
                  .getCustomerDeviceInfoCall
                  .entityTypeOfDeviceByCustomerId04(
            (_model.getCustomerDeviceInfoResponse?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          FFAppState().deviceId = (HydrometerAPIEndpointsGroup
                  .getCustomerDeviceInfoCall
                  .entityTypeOfDeviceByCustomerId01(
            (_model.getCustomerDeviceInfoResponse?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
        });
        setState(() {
          FFAppState().apiLoaded = true;
          FFAppState().consunptionFromNow =
              functions.calculateTimestampFromNow()!;
          FFAppState().consunptionFromThirtyDaysAgo =
              functions.calculateMilliseconds(30);
          FFAppState().consunptionFromSevenDaysAgo = '7';
          FFAppState().consunptionFromOneDayAgo =
              functions.calculateMilliseconds(1);
        });
        _model.getLatestTimeSeriesResponse01 =
            await HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.call(
          entityId: FFAppState().deviceId00,
          keys: 'hidrometro',
          startTs: functions.twentyMinutesAgo(),
          endTs: functions.calculateMilliseconds(0),
          token: FFAppState().lstoken,
        );
        _model.getLatestTimeSeriesResponse02 =
            await HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.call(
          entityId: FFAppState().deviceId01,
          keys: 'hidrometro',
          startTs: functions.twentyMinutesAgo(),
          endTs: functions.calculateMilliseconds(0),
          token: FFAppState().lstoken,
        );
        _model.getLatestTimeSeriesResponse03 =
            await HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.call(
          entityId: FFAppState().deviceId02,
          keys: 'hidrometro',
          startTs: functions.twentyMinutesAgo(),
          endTs: functions.calculateMilliseconds(0),
          token: FFAppState().lstoken,
        );
        _model.getLatestTimeSeriesResponse04 =
            await HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.call(
          entityId: FFAppState().deviceId03,
          keys: 'hidrometro',
          startTs: functions.twentyMinutesAgo(),
          endTs: functions.calculateMilliseconds(0),
          token: FFAppState().lstoken,
        );
        _model.getAllLatestTimeSeriesResponse =
            await HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.call(
          entityId: FFAppState().deviceId00,
          keys: 'hidrometro',
          token: FFAppState().lstoken,
          startTs: functions.twentyMinutesAgo(),
          endTs: functions.calculateMilliseconds(0),
        );
        setState(() {
          FFAppState().responseLatestValue = (HydrometerAPIEndpointsGroup
                  .getLastestTimeSeriesDataCall
                  .hidrometroValues(
            (_model.getLatestTimeSeriesResponse01?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          FFAppState().responseLatestValue01 = (HydrometerAPIEndpointsGroup
                  .getLastestTimeSeriesDataCall
                  .hidrometroValues(
            (_model.getLatestTimeSeriesResponse01?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          FFAppState().responseLatestValue02 = (HydrometerAPIEndpointsGroup
                  .getLastestTimeSeriesDataCall
                  .hidrometroValues(
            (_model.getLatestTimeSeriesResponse02?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          FFAppState().responseLatestValue03 = (HydrometerAPIEndpointsGroup
                  .getLastestTimeSeriesDataCall
                  .hidrometroValues(
            (_model.getLatestTimeSeriesResponse03?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          FFAppState().responseLatestValue04 = (HydrometerAPIEndpointsGroup
                  .getLastestTimeSeriesDataCall
                  .hidrometroValues(
            (_model.getLatestTimeSeriesResponse04?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
        });
        setState(() {
          FFAppState().apiLoadedSecondScreen = true;
        });
        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Erro ao obter os dados de seu dispositivo, contate o suporte.',
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).tipografiaTitulo,
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).background2,
            action: SnackBarAction(
              label: 'Ok',
              textColor: FlutterFlowTheme.of(context).primary,
              onPressed: () async {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
        return;
      }
    });

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).background2,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!FFAppState().apiLoadedSecondScreen)
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: custom_widgets.ShimmerEffectTwo(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            baseColor: FlutterFlowTheme.of(context).outline,
                            highlightColor: FlutterFlowTheme.of(context).icones,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (FFAppState().apiLoadedSecondScreen)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Buscar por apartamentos',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 44.0,
                                  icon: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 360.0,
                          decoration: BoxDecoration(),
                          child: DefaultTabController(
                            length: 3,
                            initialIndex: 0,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor:
                                        FlutterFlowTheme.of(context).primary,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .tipografiaCorpo,
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    tabs: [
                                      Tab(
                                        text: 'Diário',
                                      ),
                                      Tab(
                                        text: 'Semanal',
                                      ),
                                      Tab(
                                        text: 'Mensal',
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId00,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'day'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList01GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 01',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue01) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList01GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId01,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'day'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList02GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 02',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue02) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList02GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId02,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'day'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList03GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 03',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue03) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList03GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId03,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'day'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList04GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 04',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue04) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList04GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId00,
                                                  startTs: functions
                                                      .calculateMilliseconds(7),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList01GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 01',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue01) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList01GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId01,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'week'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList02GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 02',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue02) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList02GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId02,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'week'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList03GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 03',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue03) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList03GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId03,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'week'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList04GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 04',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue04) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList04GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId00,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'month'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList01GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 01',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue01) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList01GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId01,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'month'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList02GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 02',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue02) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList02GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId02,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'month'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList03GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 03',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue03) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList03GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HydrometerAPIEndpointsGroup
                                                    .getLastestTimeSeriesDataCall
                                                    .call(
                                                  keys: 'hidrometro',
                                                  token: FFAppState().lstoken,
                                                  entityId:
                                                      FFAppState().deviceId03,
                                                  startTs: functions
                                                      .getFirstDateTimestamp(
                                                          'month'),
                                                  endTs: functions
                                                      .calculateTimestampFromNow(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final apartamentList04GetLastestTimeSeriesDataResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '',
                                                              'Apartamento 04',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    int.parse(FFAppState()
                                                                            .responseLatestValue04) -
                                                                        int.parse((HydrometerAPIEndpointsGroup.getLastestTimeSeriesDataCall.hidrometroValues(
                                                                          apartamentList04GetLastestTimeSeriesDataResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            .last),
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .commaDecimal,
                                                                  ),
                                                                  'null',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                'm³',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
