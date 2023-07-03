import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key? key,
    this.dateTimePicked,
  }) : super(key: key);

  final DateTime? dateTimePicked;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().apiLoaded = false;
      });
      if (FFAppState().tokenIsPicked == true) {
        _model.getUserTokenIsEnable =
            await HydrometerAPIEndpointsGroup.postRefreshTokenCall.call(
          refreshToken: FFAppState().lsrefreshtoken,
        );
        setState(() {
          FFAppState().lstoken =
              HydrometerAPIEndpointsGroup.postRefreshTokenCall
                  .token(
                    (_model.getUserTokenIsEnable?.jsonBody ?? ''),
                  )
                  .toString();
        });
        _model.getCurrentUserResponse =
            await HydrometerAPIEndpointsGroup.getCurrentUserCall.call(
          token: FFAppState().lstoken,
        );
        if ((_model.getCurrentUserResponse?.succeeded ?? true)) {
          setState(() {
            FFAppState().lscustomerid =
                HydrometerAPIEndpointsGroup.getCurrentUserCall
                    .customerId(
                      (_model.getCurrentUserResponse?.jsonBody ?? ''),
                    )
                    .toString();
            FFAppState().lsname = HydrometerAPIEndpointsGroup.getCurrentUserCall
                .name(
                  (_model.getCurrentUserResponse?.jsonBody ?? ''),
                )
                .toString();
          });
          _model.getCustomerDeviceInfoResponse =
              await HydrometerAPIEndpointsGroup.getCustomerDeviceInfoCall.call(
            customerId: FFAppState().lscustomerid,
            token: FFAppState().lstoken,
          );
          if ((_model.getCustomerDeviceInfoResponse?.succeeded ?? true)) {
            setState(() {
              FFAppState().deviceId = FFAppState().lscustomerid;
              FFAppState().listOfDevices = (HydrometerAPIEndpointsGroup
                      .getCustomerDeviceInfoCall
                      .entityTypeOfDeviceByCustomerId(
                (_model.getCustomerDeviceInfoResponse?.jsonBody ?? ''),
              ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList()
                  .cast<String>();
            });
            _model.responseGetAttributes =
                await HydrometerAPIEndpointsGroup.getAttributesCall.call(
              token: FFAppState().lstoken,
              keys: valueOrDefault<String>(
                'tarifa',
                'tarifa',
              ),
              entityType: 'DEVICE',
              entityId: FFAppState().listOfDevices.first,
            );
            _model.getCustomerAssetInfos = await HydrometerAPIEndpointsGroup
                .getCustomerAssetInfosCall
                .call(
              token: FFAppState().lstoken,
              customerId: FFAppState().lscustomerid,
            );
            setState(() {
              FFAppState().assetIdResponse =
                  HydrometerAPIEndpointsGroup.getCustomerAssetInfosCall
                      .assetId(
                        (_model.getCustomerAssetInfos?.jsonBody ?? ''),
                      )
                      .toString();
            });
            setState(() {
              FFAppState().apiLoaded = true;
              FFAppState().consunptionFromNow =
                  functions.calculateTimestampFromNow()!;
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
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Tivemos um erro ao validar seu usuário, contate o suporte.',
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
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Sessão expirada'),
              content: Text(
                  'Sua sessão expirou, você precisará realizar o login novamente!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(
          'Login',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 600),
            ),
          },
        );

        return;
      }
    });

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
              children: [
                if (!FFAppState().apiLoaded)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: custom_widgets.ShimmerEffectOne(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              baseColor: FlutterFlowTheme.of(context).outline,
                              highlightColor:
                                  FlutterFlowTheme.of(context).icones,
                            ),
                          ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
                  ),
                if (FFAppState().apiLoaded)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryHover,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2.0, 2.0, 2.0, 2.0),
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Logo.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        valueOrDefault<String>(
                                          FFAppState().lsname,
                                          'Default',
                                        ).maybeHandleOverflow(
                                          maxChars: 20,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            FFAppState().email,
                                            'Default',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 8.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.responseOfFunctionLatestValueOne =
                                            await actions
                                                .sumConsunptionsByAsset(
                                          FFAppState().assetIdResponse,
                                          functions
                                              .getFirstDateTimestamp('day'),
                                          functions
                                              .calculateTimestampFromNow()!,
                                          FFAppState().lstoken,
                                        );
                                        _model.responseOfFunctionLatestValueTwo =
                                            await actions
                                                .sumConsunptionsByAsset(
                                          FFAppState().assetIdResponse,
                                          functions.twentyMinutesAgo(),
                                          functions
                                              .calculateTimestampFromNow()!,
                                          FFAppState().lstoken,
                                        );
                                        setState(() {
                                          FFAppState()
                                                  .responseAPILatestValueOne =
                                              _model
                                                  .responseOfFunctionLatestValueOne!;
                                          FFAppState()
                                                  .responseAPILatestValueTwo =
                                              _model
                                                  .responseOfFunctionLatestValueTwo!;
                                        });

                                        setState(() {});
                                      },
                                      text: 'Dia',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .background,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tipografiaTitulo,
                                            ),
                                        elevation: 1.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.responseOfFunctionLatestValueThree =
                                            await actions
                                                .sumConsunptionsByAsset(
                                          FFAppState().assetIdResponse,
                                          functions
                                              .getFirstDateTimestamp('week'),
                                          functions
                                              .calculateTimestampFromNow()!,
                                          FFAppState().lstoken,
                                        );
                                        _model.responseOfFunctionLatestValueFour =
                                            await actions
                                                .sumConsunptionsByAsset(
                                          FFAppState().assetIdResponse,
                                          functions.twentyMinutesAgo(),
                                          functions
                                              .calculateTimestampFromNow()!,
                                          FFAppState().lstoken,
                                        );
                                        setState(() {
                                          FFAppState()
                                                  .responseAPILatestValueOne =
                                              _model
                                                  .responseOfFunctionLatestValueThree!;
                                          FFAppState()
                                                  .responseAPILatestValueTwo =
                                              _model
                                                  .responseOfFunctionLatestValueFour!;
                                        });

                                        setState(() {});
                                      },
                                      text: 'Semana',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .background,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tipografiaTitulo,
                                            ),
                                        elevation: 1.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.responseOfFunctionLatestValueFive =
                                            await actions
                                                .sumConsunptionsByAsset(
                                          FFAppState().assetIdResponse,
                                          functions
                                              .getFirstDateTimestamp('month'),
                                          functions
                                              .calculateTimestampFromNow()!,
                                          FFAppState().lstoken,
                                        );
                                        _model.responseOfFunctionLatestValueSix =
                                            await actions
                                                .sumConsunptionsByAsset(
                                          FFAppState().assetIdResponse,
                                          functions.twentyMinutesAgo(),
                                          functions
                                              .calculateTimestampFromNow()!,
                                          FFAppState().lstoken,
                                        );
                                        setState(() {
                                          FFAppState()
                                                  .responseAPILatestValueOne =
                                              _model
                                                  .responseOfFunctionLatestValueFive!;
                                          FFAppState()
                                                  .responseAPILatestValueTwo =
                                              _model
                                                  .responseOfFunctionLatestValueSix!;
                                        });

                                        setState(() {});
                                      },
                                      text: 'Mês',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .background,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tipografiaTitulo,
                                            ),
                                        elevation: 1.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final _datePickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: DateTime(1900),
                                          lastDate: getCurrentTimestamp,
                                        );

                                        TimeOfDay? _datePickedTime;
                                        if (_datePickedDate != null) {
                                          _datePickedTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                getCurrentTimestamp),
                                          );
                                        }

                                        if (_datePickedDate != null &&
                                            _datePickedTime != null) {
                                          setState(() {
                                            _model.datePicked = DateTime(
                                              _datePickedDate.year,
                                              _datePickedDate.month,
                                              _datePickedDate.day,
                                              _datePickedTime!.hour,
                                              _datePickedTime.minute,
                                            );
                                          });
                                        }
                                        _model.responseOfFunctionLatestValueSeven =
                                            await actions.sumConsunptions(
                                          FFAppState().listOfDevices.toList(),
                                          _model.datePicked!
                                              .millisecondsSinceEpoch
                                              .toString(),
                                          functions
                                              .calculateTimestampFromNow()!,
                                          'hidrometro',
                                          FFAppState().lstoken,
                                        );
                                        _model.responseOfFunctionLatestValueEigth =
                                            await actions.sumConsunptions(
                                          FFAppState().listOfDevices.toList(),
                                          valueOrDefault<String>(
                                            functions.twentyMinutesAgo(),
                                            '0',
                                          ),
                                          functions
                                              .calculateTimestampFromNow()!,
                                          'hidrometro',
                                          FFAppState().lstoken,
                                        );
                                        setState(() {
                                          FFAppState()
                                                  .responseAPILatestValueOne =
                                              _model
                                                  .responseOfFunctionLatestValueSeven!;
                                          FFAppState()
                                                  .responseAPILatestValueTwo =
                                              _model
                                                  .responseOfFunctionLatestValueEigth!;
                                        });

                                        setState(() {});
                                      },
                                      text: 'Personalizado',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .background,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tipografiaTitulo,
                                            ),
                                        elevation: 1.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: HydrometerAPIEndpointsGroup
                                  .getCustomerAssetInfosCall
                                  .call(
                                customerId: FFAppState().lscustomerid,
                                token: FFAppState().lstoken,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                final stackGetCustomerAssetInfosResponse =
                                    snapshot.data!;
                                return Container(
                                  width: 296.0,
                                  height: 296.0,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Container(
                                        width: 296.0,
                                        height: 296.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .background,
                                          borderRadius:
                                              BorderRadius.circular(148.0),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Condomínio',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons.drupal,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 36.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        valueOrDefault<double>(
                                                              FFAppState()
                                                                  .responseAPILatestValueTwo,
                                                              0.0,
                                                            ) -
                                                            valueOrDefault<
                                                                double>(
                                                              FFAppState()
                                                                  .responseAPILatestValueOne,
                                                              0.0,
                                                            ),
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .commaDecimal,
                                                      ),
                                                      '00000000',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall,
                                                  ),
                                                  Text(
                                                    'm³',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                functions.calculateWaterExpense(
                                                    valueOrDefault<double>(
                                                          FFAppState()
                                                              .responseAPILatestValueTwo,
                                                          0.0,
                                                        ) -
                                                        valueOrDefault<double>(
                                                          FFAppState()
                                                              .responseAPILatestValueOne,
                                                          0.0,
                                                        ),
                                                    (HydrometerAPIEndpointsGroup
                                                            .getAttributesCall
                                                            .valorTarifa(
                                                      (_model.responseGetAttributes
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()
                                                        .first
                                                        .toString()),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.commaDecimal,
                                                currency: 'R\$',
                                              ),
                                              '000000',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
