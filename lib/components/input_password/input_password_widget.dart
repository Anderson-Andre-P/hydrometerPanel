import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_password_model.dart';
export 'input_password_model.dart';

class InputPasswordWidget extends StatefulWidget {
  const InputPasswordWidget({Key? key}) : super(key: key);

  @override
  _InputPasswordWidgetState createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  late InputPasswordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputPasswordModel());

    _model.passwordAddressController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.passwordAddressController?.text = 'ietecnologia';
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 380.0,
      child: TextFormField(
        controller: _model.passwordAddressController,
        textCapitalization: TextCapitalization.none,
        obscureText: !_model.passwordAddressVisibility,
        decoration: InputDecoration(
          labelText: 'Senha',
          labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tipografiaCorpo,
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
          hintText: 'Senha',
          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tipografiaCorpo,
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).outline,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).input,
          contentPadding:
              EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 20.0, 24.0),
          suffixIcon: InkWell(
            onTap: () => setState(
              () => _model.passwordAddressVisibility =
                  !_model.passwordAddressVisibility,
            ),
            focusNode: FocusNode(skipTraversal: true),
            child: Icon(
              _model.passwordAddressVisibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: FlutterFlowTheme.of(context).icones,
              size: 22.0,
            ),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Lexend Deca',
              color: FlutterFlowTheme.of(context).tipografiaCorpo,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
        validator:
            _model.passwordAddressControllerValidator.asValidator(context),
      ),
    );
  }
}
