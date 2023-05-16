import '/components/wanna_go_out/wanna_go_out_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: FlutterFlowTheme.of(context).background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Política de privacidade'),
                        content: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus scelerisque blandit. Praesent nec ultrices velit. Morbi et dui nec neque pulvinar commodo efficitur nec ipsum. Cras eget semper ante, in luctus felis. Mauris sollicitudin neque a iaculis consectetur. Ut id dictum justo, vel vestibulum risus. Etiam fringilla diam in turpis varius convallis. Suspendisse potenti. Curabitur ligula velit, placerat a eros eu, vehicula bibendum nisi. Integer tempus, quam sed suscipit placerat, dolor leo iaculis enim, pharetra interdum ipsum purus a massa. Etiam viverra eros dolor, non congue augue lacinia condimentum. Nulla mollis convallis consectetur. Sed lorem lorem, pretium sit amet libero id, mattis hendrerit enim. Sed pellentesque non tortor vel blandit. Donec nunc enim, convallis ut tempor faucibus, porttitor ut nisi. Etiam feugiat est in bibendum viverra.  Cras urna sem, ultricies posuere nibh ac, ultricies facilisis justo. Sed eget blandit nisl. Aenean a lorem ante. Morbi eu aliquam tortor. Vestibulum eleifend sed dolor ut ornare. Duis sit amet tortor vitae eros rutrum pellentesque. Praesent nec ex eu nisi cursus porttitor. Quisque ut ligula ut neque accumsan ultrices. Praesent blandit velit at tellus feugiat tincidunt. Sed vehicula tellus at nunc convallis, et vehicula turpis dignissim.  In aliquet cursus scelerisque. Nullam rutrum facilisis blandit. Proin ut dapibus eros. Aliquam scelerisque lacus at auctor mollis. Sed varius luctus nibh non laoreet. Ut pulvinar aliquam lectus vel egestas. Proin suscipit felis eget ullamcorper volutpat.  Aenean quis mauris et sapien laoreet sodales. Etiam pulvinar, ex sed ultricies eleifend, dolor arcu tincidunt justo, nec feugiat ex ante ac urna. Duis in luctus leo, vitae aliquet magna. Nulla vehicula dolor quis felis dapibus consequat. Vivamus non sollicitudin diam. Fusce ut lectus risus. Etiam tempus felis lacus, id dapibus purus volutpat non. Phasellus mi est, condimentum ac convallis eget, vehicula sed lectus. Nunc elementum eu massa eu consequat.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ListTile(
                  title: Text(
                    'Política de privacidade',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).tipografiaCorpo,
                        ),
                  ),
                  trailing: Icon(
                    Icons.privacy_tip_outlined,
                    color: FlutterFlowTheme.of(context).icones,
                    size: 20.0,
                  ),
                  tileColor: FlutterFlowTheme.of(context).background,
                  dense: false,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).background2,
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Ajuda e suporte'),
                        content: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus scelerisque blandit. Praesent nec ultrices velit. Morbi et dui nec neque pulvinar commodo efficitur nec ipsum. Cras eget semper ante, in luctus felis. Mauris sollicitudin neque a iaculis consectetur. Ut id dictum justo, vel vestibulum risus. Etiam fringilla diam in turpis varius convallis. Suspendisse potenti. Curabitur ligula velit, placerat a eros eu, vehicula bibendum nisi. Integer tempus, quam sed suscipit placerat, dolor leo iaculis enim, pharetra interdum ipsum purus a massa. Etiam viverra eros dolor, non congue augue lacinia condimentum. Nulla mollis convallis consectetur. Sed lorem lorem, pretium sit amet libero id, mattis hendrerit enim. Sed pellentesque non tortor vel blandit. Donec nunc enim, convallis ut tempor faucibus, porttitor ut nisi. Etiam feugiat est in bibendum viverra.  Cras urna sem, ultricies posuere nibh ac, ultricies facilisis justo. Sed eget blandit nisl. Aenean a lorem ante. Morbi eu aliquam tortor. Vestibulum eleifend sed dolor ut ornare. Duis sit amet tortor vitae eros rutrum pellentesque. Praesent nec ex eu nisi cursus porttitor. Quisque ut ligula ut neque accumsan ultrices. Praesent blandit velit at tellus feugiat tincidunt. Sed vehicula tellus at nunc convallis, et vehicula turpis dignissim.  In aliquet cursus scelerisque. Nullam rutrum facilisis blandit. Proin ut dapibus eros. Aliquam scelerisque lacus at auctor mollis. Sed varius luctus nibh non laoreet. Ut pulvinar aliquam lectus vel egestas. Proin suscipit felis eget ullamcorper volutpat.  Aenean quis mauris et sapien laoreet sodales. Etiam pulvinar, ex sed ultricies eleifend, dolor arcu tincidunt justo, nec feugiat ex ante ac urna. Duis in luctus leo, vitae aliquet magna. Nulla vehicula dolor quis felis dapibus consequat. Vivamus non sollicitudin diam. Fusce ut lectus risus. Etiam tempus felis lacus, id dapibus purus volutpat non. Phasellus mi est, condimentum ac convallis eget, vehicula sed lectus. Nunc elementum eu massa eu consequat.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ListTile(
                  title: Text(
                    'Ajuda e suporte',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).tipografiaCorpo,
                        ),
                  ),
                  trailing: Icon(
                    Icons.help_outline,
                    color: FlutterFlowTheme.of(context).icones,
                    size: 20.0,
                  ),
                  tileColor: FlutterFlowTheme.of(context).background,
                  dense: false,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).background2,
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        insetPadding: MediaQuery.of(dialogContext).viewInsets,
                        backgroundColor: Color(0x34000000),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: WannaGoOutWidget(),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                child: ListTile(
                  title: Text(
                    'Sair',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).tipografiaCorpo,
                        ),
                  ),
                  trailing: Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.of(context).icones,
                    size: 20.0,
                  ),
                  tileColor: FlutterFlowTheme.of(context).background,
                  dense: false,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
