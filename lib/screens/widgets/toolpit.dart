import 'package:flutter/material.dart';

class ToolpitWidget extends StatefulWidget {
  const ToolpitWidget({Key? key}) : super(key: key);

  @override
  _ToolpitWidgetState createState() => _ToolpitWidgetState();
}

class _ToolpitWidgetState extends State<ToolpitWidget> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      triggerMode: TooltipTriggerMode.tap,
      waitDuration: Duration(seconds: 1),
      showDuration: Duration(seconds: 1),
      padding: EdgeInsets.all(10),
      height: 20,
      textStyle: TextStyle(
          fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(1)),
      message: 'You have to buy membership',
    );
  }
}
