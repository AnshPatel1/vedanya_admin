import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SgtwtWidget extends StatefulWidget {
  const SgtwtWidget({Key key}) : super(key: key);

  @override
  _SgtwtWidgetState createState() => _SgtwtWidgetState();
}

class _SgtwtWidgetState extends State<SgtwtWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FlutterFlowWebView(
            url: 'https://flutter.dev',
            bypass: false,
            verticalScroll: false,
            horizontalScroll: false,
          ),
        ),
      ),
    );
  }
}
