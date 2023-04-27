import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'configuracoes_model.dart';
export 'configuracoes_model.dart';

class ConfiguracoesWidget extends StatefulWidget {
  const ConfiguracoesWidget({Key? key}) : super(key: key);

  @override
  _ConfiguracoesWidgetState createState() => _ConfiguracoesWidgetState();
}

class _ConfiguracoesWidgetState extends State<ConfiguracoesWidget> {
  late ConfiguracoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfiguracoesModel());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleIcon(
                    onPressed: () async {
                      setState(() =>
                          FFAppState().isDarkTheme = !FFAppState().isDarkTheme);
                    },
                    value: FFAppState().isDarkTheme,
                    onIcon: FaIcon(
                      FontAwesomeIcons.solidMoon,
                      color: FlutterFlowTheme.of(context).tipografiaTitulo,
                      size: 25.0,
                    ),
                    offIcon: Icon(
                      Icons.wb_sunny,
                      color: FlutterFlowTheme.of(context).tipografiaTitulo,
                      size: 25.0,
                    ),
                  ),
                  Text(
                    'Trocar tema',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              ),
              Container(
                width: 100.0,
                height: 24.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Sair do aplicativo',
                options: FFButtonOptions(
                  width: 380.0,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                  elevation: 1.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                  hoverColor: FlutterFlowTheme.of(context).primaryHover,
                  hoverTextColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  hoverElevation: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
