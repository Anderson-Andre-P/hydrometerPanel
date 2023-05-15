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

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (postRefreshToken)] action in Home widget.
  ApiCallResponse? getUserTokenIsEnable;
  // Stores action output result for [Backend Call - API (getCurrentUser)] action in Home widget.
  ApiCallResponse? getCurrentUserResponse;
  // Stores action output result for [Backend Call - API (getCustomerDeviceInfo)] action in Home widget.
  ApiCallResponse? getCustomerDeviceInfoResponse;
  // Stores action output result for [Backend Call - API (getTimeSeriesData)] action in Home widget.
  ApiCallResponse? getTimeSeriesDataResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
