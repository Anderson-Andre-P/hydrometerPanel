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

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postRefreshToken)] action in Home widget.
  ApiCallResponse? getUserTokenIsEnable;
  // Stores action output result for [Backend Call - API (getCurrentUser)] action in Home widget.
  ApiCallResponse? getCurrentUserResponse;
  // Stores action output result for [Backend Call - API (getCustomerDeviceInfo)] action in Home widget.
  ApiCallResponse? getCustomerDeviceInfoResponse;
  // Stores action output result for [Backend Call - API (getAttributes)] action in Home widget.
  ApiCallResponse? responseGetAttributes;
  // Stores action output result for [Backend Call - API (getCustomerAssetInfos)] action in Home widget.
  ApiCallResponse? getCustomerAssetInfos;
  // Stores action output result for [Custom Action - sumConsunptionsByAsset] action in Button widget.
  double? responseOfFunctionLatestValueOne;
  // Stores action output result for [Custom Action - sumConsunptionsByAsset] action in Button widget.
  double? responseOfFunctionLatestValueTwo;
  // Stores action output result for [Custom Action - sumConsunptionsByAsset] action in Button widget.
  double? responseOfFunctionLatestValueThree;
  // Stores action output result for [Custom Action - sumConsunptionsByAsset] action in Button widget.
  double? responseOfFunctionLatestValueFour;
  // Stores action output result for [Custom Action - sumConsunptionsByAsset] action in Button widget.
  double? responseOfFunctionLatestValueFive;
  // Stores action output result for [Custom Action - sumConsunptionsByAsset] action in Button widget.
  double? responseOfFunctionLatestValueSix;
  DateTime? datePicked;
  // Stores action output result for [Custom Action - sumConsunptions] action in Button widget.
  double? responseOfFunctionLatestValueSeven;
  // Stores action output result for [Custom Action - sumConsunptions] action in Button widget.
  double? responseOfFunctionLatestValueEigth;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
