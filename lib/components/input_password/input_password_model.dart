import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputPasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for passwordAddress widget.
  TextEditingController? passwordAddressController;
  late bool passwordAddressVisibility;
  String? Function(BuildContext, String?)? passwordAddressControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordAddressVisibility = false;
  }

  void dispose() {
    passwordAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
