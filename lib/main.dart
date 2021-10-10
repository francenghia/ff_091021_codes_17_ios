import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:shootpoints/staring_info_page/staring_info_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'ana_sayfa/ana_sayfa_widget.dart';
import 'my_profil/my_profil_widget.dart';
import 'contests/contests_widget.dart';
import 'transactions/transactions_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<ShootpointsFirebaseUser> userStream;
  ShootpointsFirebaseUser initialUser;
  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = shootpointsFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHOOTPOINTS',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? Container(
              color: Color(0xFF427AE1),
              child: Center(
                child: Builder(
                  builder: (context) => Image.asset(
                    'assets/images/SP_LOGO.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : StaringInfoPageWidget(),
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
  String _currentPage = 'ana_sayfa';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'ana_sayfa': AnaSayfaWidget(),
      'my_profil': MyProfilWidget(),
      'Contests': ContestsWidget(),
      'transactions': TransactionsWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 26,
            ),
            label: 'Ana Sayfa',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.person,
              size: 26,
            ),
            label: 'Profilim',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_events_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.emoji_events,
              size: 26,
            ),
            label: 'Yarışma',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_fire_department_rounded,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.local_fire_department_outlined,
              size: 24,
            ),
            label: 'Hesap',
            tooltip: '',
          )
        ],
        backgroundColor: Colors.black,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xB9FFFFFF),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
