import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/src/util/view_utils.dart';

part 'smart_dialog_controller.dart';

class DialogScope extends StatefulWidget {
  const DialogScope({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  final SmartDialogController? controller;

  final WidgetBuilder builder;

  @override
  State<DialogScope> createState() => _DialogScopeState();
}

class _DialogScopeState extends State<DialogScope> {
  VoidCallback? _callback;

  @override
  void initState() {
    widget.controller?._setListener(_callback = () {
      ViewUtils.addSafeUse(() => setState(() {}));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  @override
  void dispose() {
    if (_callback == widget.controller?._callback) {
      widget.controller?._dismiss();
    }

    super.dispose();
  }
}
