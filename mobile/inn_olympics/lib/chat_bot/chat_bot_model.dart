import '/flutter_flow/flutter_flow_util.dart';
import 'chat_bot_widget.dart' show ChatBotWidget;
import 'package:flutter/material.dart';

class ChatBotModel extends FlutterFlowModel<ChatBotWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtPrompt widget.
  FocusNode? txtPromptFocusNode;
  TextEditingController? txtPromptTextController;
  String? Function(BuildContext, String?)? txtPromptTextControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in btnSubmit widget.
  String? response;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtPromptFocusNode?.dispose();
    txtPromptTextController?.dispose();
  }
}
