import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vedanya_admin/login/login_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page/home_page_widget.dart';
import 'activity_page/activity_page_widget.dart';
import 'settings/settings_widget.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'flutter_flow/flutter_flow_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterFlowTheme.initialize();

  // Initialize FFAppState.
  FFAppState();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vedanya Admin',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: NavBarPage(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'ActivityPage': ActivityPageWidget(),
      'settings': SettingsWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: Color(0xFF0D0D0D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFFA1A1A1),
        selectedBackgroundColor: FlutterFlowTheme.of(context).primaryColor,
        borderRadius: 25,
        itemBorderRadius: 25,
        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
        width: MediaQuery.of(context).size.width * 0.9,
        elevation: 20,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color: currentIndex == 0 ? Colors.white : Color(0xFFA1A1A1),
                  size: 24,
                ),
                Text(
                  'Home',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.chartBar,
                  color: currentIndex == 1 ? Colors.white : Color(0xFFA1A1A1),
                  size: 24,
                ),
                Text(
                  'Home',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 2 ? Icons.person : Icons.person_outlined,
                  color: currentIndex == 2 ? Colors.white : Color(0xFFA1A1A1),
                  size: 24,
                ),
                Text(
                  'Profile',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
