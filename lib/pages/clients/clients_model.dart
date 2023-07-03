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

class ClientsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getCustomerDeviceInfo)] action in Clients widget.
  ApiCallResponse? getCustomerDeviceInfoResponse;
  // Stores action output result for [Backend Call - API (getLastestTimeSeriesData)] action in Clients widget.
  ApiCallResponse? getLatestTimeSeriesResponse01;
  // Stores action output result for [Backend Call - API (getLastestTimeSeriesData)] action in Clients widget.
  ApiCallResponse? getLatestTimeSeriesResponse02;
  // Stores action output result for [Backend Call - API (getLastestTimeSeriesData)] action in Clients widget.
  ApiCallResponse? getLatestTimeSeriesResponse03;
  // Stores action output result for [Backend Call - API (getLastestTimeSeriesData)] action in Clients widget.
  ApiCallResponse? getLatestTimeSeriesResponse04;
  // Stores action output result for [Backend Call - API (getLastestTimeSeriesData)] action in Clients widget.
  ApiCallResponse? getAllLatestTimeSeriesResponse;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
