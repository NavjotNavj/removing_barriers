import 'package:flutter/material.dart';

class VisibilityExtended extends StatefulWidget {

  Widget? child;
  bool? visible;
  Widget? replacement;
  double? opacity;

  VisibilityExtended({this.child, this.visible, this.replacement, this.opacity});

  @override
  _VisibilityExtendedState createState() => _VisibilityExtendedState();
}

class _VisibilityExtendedState extends State<VisibilityExtended> {
  @override
  Widget build(BuildContext context) {
    
    if(widget.visible!) {
      return widget.child!;
    } else {
      return widget.replacement ?? SizedBox.shrink();
    }

  }
}