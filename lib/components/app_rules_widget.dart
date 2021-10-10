import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../sign_up_bu/sign_up_bu_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppRulesWidget extends StatefulWidget {
  AppRulesWidget({Key key}) : super(key: key);

  @override
  _AppRulesWidgetState createState() => _AppRulesWidgetState();
}

class _AppRulesWidgetState extends State<AppRulesWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              child: AutoSizeText(
                'Kayıt olarak kullanıcı koşullarını ve aşağıdaki şartlara uymayı kabul etmiş olursunuz.',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF090F13),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(),
              child: StreamBuilder<List<AppRulesRecord>>(
                stream: queryAppRulesRecord(
                  queryBuilder: (appRulesRecord) =>
                      appRulesRecord.orderBy('no'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                    );
                  }
                  List<AppRulesRecord> listViewAppRulesRecordList =
                      snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewAppRulesRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewAppRulesRecord =
                          listViewAppRulesRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Icon(
                                Icons.blur_on_sharp,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: AutoSizeText(
                                  listViewAppRulesRecord.rule,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 10, 4, 25),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() => _loadingButton1 = true);
                    try {
                      Navigator.pop(context);
                    } finally {
                      setState(() => _loadingButton1 = false);
                    }
                  },
                  text: 'İptal',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.black,
                    ),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: 4,
                  ),
                  loading: _loadingButton1,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 10, 4, 25),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() => _loadingButton2 = true);
                    try {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpBuWidget(),
                        ),
                      );
                    } finally {
                      setState(() => _loadingButton2 = false);
                    }
                  },
                  text: 'TAMAM',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: Color(0xFF4C3AF3),
                    textStyle: FlutterFlowTheme.subtitle1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 4,
                  ),
                  loading: _loadingButton2,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
