import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsDetailWidget extends StatefulWidget {
  UsDetailWidget({Key key}) : super(key: key);

  @override
  _UsDetailWidgetState createState() => _UsDetailWidgetState();
}

class _UsDetailWidgetState extends State<UsDetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          'Biz Kimiz',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF14181B),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              child: Text(
                'Shootpoints',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Swanky and Moo Moo',
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 32),
              child: Text(
                'Yalcons yazılım bir uygulama geliştirme firması. Amacımız kullanışlı, eğlenceli ve güvenli uygulamalar geliştirmek. ShootPoints Yalcons Yazılım\'ın pek çok uygulamasından bir tanesi. ShootPoints 2017 yılından beri geliştirilmekte ve Türkiye’nin ilk ve tek fotoğraf yarışması platformu. Sizlerin talep ve değerlendirmelerine göre her gün geliştirilmeye devam ediyor..',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  fontSize: 22,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
