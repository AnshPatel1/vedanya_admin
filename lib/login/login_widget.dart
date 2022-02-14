import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  ApiCallResponse apiCallOutput;
  TextEditingController textController1;
  TextEditingController textController2;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFD0F8E3),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.06, -0.63),
                      child: Image.asset(
                        'assets/images/vedanya_logo.png',
                        width: 280,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.05, -0.38),
                      child: Text(
                        'ADMIN',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF3AA88A),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.67),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: TextFormField(
                              onFieldSubmitted: (_) async {
                                setState(() => FFAppState().username =
                                    textController1.text);
                              },
                              controller: textController1,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF3AA88A),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF3AA88A),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xFF102F21),
                                ),
                              ),
                              style: GoogleFonts.getFont(
                                'Lato',
                                color: Color(0xFF102F21),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: TextFormField(
                              onFieldSubmitted: (_) async {
                                setState(() => FFAppState().password =
                                    textController2.text);
                              },
                              controller: textController2,
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF3AA88A),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF3AA88A),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_open_sharp,
                                  color: Color(0xFF102F21),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => passwordVisibility =
                                        !passwordVisibility,
                                  ),
                                  child: Icon(
                                    passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF102F21),
                                    size: 20,
                                  ),
                                ),
                              ),
                              style: GoogleFonts.getFont(
                                'Lato',
                                color: Color(0xFF102F21),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          apiCallOutput = await LoginAuthCall.call(
                            username: textController1.text,
                            passwd: textController2.text,
                          );
                          if (apiCallOutput.succeeded) {
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePageWidget(
                                  username: textController1.text,
                                  password: textController2.text,
                                ),
                              ),
                              (r) => false,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Invalid login credentials. If you think this is a mistake, please contact administrator',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0x89000000),
                              ),
                            );
                          }

                          setState(() {});
                        },
                        text: 'Login',
                        options: FFButtonOptions(
                          width: 150,
                          height: 40,
                          color: Color(0xFF3AA88A),
                          textStyle: GoogleFonts.getFont(
                            'Lato',
                            color: Color(0xFFECFBF4),
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFF3AA88A),
                            width: 2,
                          ),
                          borderRadius: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
