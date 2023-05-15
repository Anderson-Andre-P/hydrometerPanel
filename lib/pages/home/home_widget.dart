import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
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
    String? aa,
  })  : this.aa = aa ?? 'a',
        super(key: key);

  final String aa;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

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
      _model.getUserTokenIsEnable =
          await HydrometerAPIEndpointsGroup.postRefreshTokenCall.call(
        refreshToken: FFAppState().lsrefreshtoken,
      );
      if ((_model.getUserTokenIsEnable?.succeeded ?? true)) {
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
              FFAppState().deviceId =
                  HydrometerAPIEndpointsGroup.getCustomerDeviceInfoCall
                      .entityTypeOfDeviceByCustomerId(
                        (_model.getCustomerDeviceInfoResponse?.jsonBody ?? ''),
                      )
                      .toString();
              FFAppState().startTs = functions
                  .calculateTimestampFromFiftenDaysAgo()!
                  .millisecondsSinceEpoch
                  .toString();
              FFAppState().endTs =
                  functions.currentDay()!.millisecondsSinceEpoch.toString();
            });
            _model.getTimeSeriesDataResponse =
                await HydrometerAPIEndpointsGroup.getTimeSeriesDataCall.call(
              entityId: FFAppState().deviceId,
              token: FFAppState().lstoken,
              startTs: FFAppState().startTs,
              endTs: FFAppState().endTs,
              keys: 'hidrometro',
            );
            if ((_model.getTimeSeriesDataResponse?.succeeded ?? true)) {
              setState(() {
                FFAppState().lastValueHydrometer = (HydrometerAPIEndpointsGroup
                        .getTimeSeriesDataCall
                        .hidrometroValues(
                  (_model.getTimeSeriesDataResponse?.jsonBody ?? ''),
                ) as List)
                    .map<String>((s) => s.toString())
                    .toList()
                    .first;
              });
              FFAppState().update(() {
                FFAppState().apiLoaded = true;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Erro ao obter os dados das últimas leituras de seu dispositvo, contate o suporte.',
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

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).background2,
          body: SafeArea(
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
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            child: custom_widgets.ShimmerEffectOne(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 1.0,
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
                                        FFAppState().lsname.maybeHandleOverflow(
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
                                          FFAppState().email,
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
                          Container(
                            height: 400.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: DefaultTabController(
                                length: 3,
                                initialIndex: 0,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: TabBar(
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .tipografiaCorpo,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
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
                                          Container(
                                            width: 296.0,
                                            height: 100.0,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Container(
                                                  width: 296.0,
                                                  height: 296.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            148.0),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Condomínio',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .drupal,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 36.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${(HydrometerAPIEndpointsGroup.getTimeSeriesDataCall.hidrometroLastValue(
                                                              (_model.getTimeSeriesDataResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) as List).map<String>((s) => s.toString()).toList().first}m³',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      'R\$${formatNumber(
                                                        functions.calculateWaterExpense(
                                                            (HydrometerAPIEndpointsGroup
                                                                    .getTimeSeriesDataCall
                                                                    .hidrometroLastValue(
                                                          (_model.getTimeSeriesDataResponse
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList()
                                                                .first),
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .commaDecimal,
                                                      )}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Tab View 2',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 32.0,
                                                ),
                                          ),
                                          Text(
                                            'Tab View 3',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 32.0,
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
