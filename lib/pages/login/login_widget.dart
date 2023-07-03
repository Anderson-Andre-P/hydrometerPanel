import '/backend/api_requests/api_calls.dart';
import '/components/input_email/input_email_widget.dart';
import '/components/input_password/input_password_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
    this.emailFilled,
    this.passwordFilled,
  }) : super(key: key);

  final bool? emailFilled;
  final bool? passwordFilled;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late LoginModel _model;

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
    _model = createModel(context, () => LoginModel());

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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 60.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Logo.png',
                      width: 140.0,
                      height: 140.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 1,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          isScrollable: true,
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          labelPadding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F1113),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          indicatorColor:
                              FlutterFlowTheme.of(context).primaryText,
                          tabs: [
                            Tab(
                              text: 'Login',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 24.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Form(
                                        key: _model.formKey,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model.inputEmailModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: InputEmailWidget(),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: wrapWithModel(
                                                model:
                                                    _model.inputPasswordModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: InputPasswordWidget(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          _model.postLoginEndpointResponse =
                                              await HydrometerAPIEndpointsGroup
                                                  .postLoginEndpointCall
                                                  .call(
                                            email: _model.inputEmailModel
                                                .emailAddressController.text,
                                            password: _model.inputPasswordModel
                                                .passwordAddressController.text,
                                          );
                                          _shouldSetState = true;
                                          if ((_model.postLoginEndpointResponse
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().update(() {
                                              FFAppState().lstoken =
                                                  HydrometerAPIEndpointsGroup
                                                      .postLoginEndpointCall
                                                      .token(
                                                        (_model.postLoginEndpointResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      .toString();
                                              FFAppState().email = _model
                                                  .inputEmailModel
                                                  .emailAddressController
                                                  .text;
                                              FFAppState().password = _model
                                                  .inputPasswordModel
                                                  .passwordAddressController
                                                  .text;
                                              FFAppState().lsrefreshtoken =
                                                  HydrometerAPIEndpointsGroup
                                                      .postLoginEndpointCall
                                                      .refreshToken(
                                                        (_model.postLoginEndpointResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      .toString();
                                              FFAppState().tokenIsPicked = true;
                                            });
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'E-mail ou senha inválidos',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .tipografiaTitulo,
                                                      ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .background2,
                                                action: SnackBarAction(
                                                  label: 'Ok',
                                                  textColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  onPressed: () async {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                  },
                                                ),
                                              ),
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'Home',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 700),
                                              ),
                                            },
                                          );

                                          if (_shouldSetState) setState(() {});
                                        },
                                        text: 'Entrar',
                                        options: FFButtonOptions(
                                          width: 380.0,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFF7F9F9),
                                                  ),
                                          elevation: 1.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryHover,
                                          hoverTextColor: Color(0xFFF7F9F9),
                                          hoverElevation: 1.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: Text(
                                        'Esqueci minha senha',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              decoration:
                                                  TextDecoration.underline,
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
                    ],
                  ),
                ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
