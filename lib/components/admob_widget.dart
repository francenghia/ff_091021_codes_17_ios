import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmobWidget extends StatefulWidget {
  AdmobWidget({Key key}) : super(key: key);

  @override
  _AdmobWidgetState createState() => _AdmobWidgetState();
}

class _AdmobWidgetState extends State<AdmobWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.close_outlined,
                    color: Colors.black,
                    size: 32,
                  )
                ],
              ),
            ),
          ),
          FlutterFlowAdBanner(
            showsTestAd: false,
            iOSAdUnitID: 'ca-app-pub-4885782976673658/5778103651',
            androidAdUnitID: 'ca-app-pub-4885782976673658/3101287704',
          )
        ],
      ),
    );
  }
}
