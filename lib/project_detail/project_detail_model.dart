import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'project_detail_widget.dart' show ProjectDetailWidget;
import 'package:flutter/material.dart';

class ProjectDetailModel extends FlutterFlowModel<ProjectDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for passwordadduser widget.
  FocusNode? passwordadduserFocusNode;
  TextEditingController? passwordadduserController;
  late bool passwordadduserVisibility;
  String? Function(BuildContext, String?)? passwordadduserControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Checkbox widget.

  Map<TasksRecord, bool> checkboxValueMap1 = {};
  List<TasksRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<TasksRecord, bool> checkboxValueMap2 = {};
  List<TasksRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordadduserVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    passwordadduserFocusNode?.dispose();
    passwordadduserController?.dispose();

    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
