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

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for Input_Email component.
  late InputEmailModel inputEmailModel;
  // Model for Input_Password component.
  late InputPasswordModel inputPasswordModel;
  // Stores action output result for [Backend Call - API (postLoginEndpoint)] action in ButtonLogin widget.
  ApiCallResponse? postLoginEndpointResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputEmailModel = createModel(context, () => InputEmailModel());
    inputPasswordModel = createModel(context, () => InputPasswordModel());

    inputEmailModel.emailAddressControllerValidator = _formTextFieldValidator1;
    inputPasswordModel.passwordAddressControllerValidator =
        _formTextFieldValidator2;
  }

  void dispose() {
    unfocusNode.dispose();
    inputEmailModel.dispose();
    inputPasswordModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Esse campo é obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inválido';
    }
    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Esse campo é obrigatório';
    }

    if (val.length < 1) {
      return 'Você precisa digitar pelo menos 1 caractere';
    }

    return null;
  }
}
