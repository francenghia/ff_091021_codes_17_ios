import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintWidget extends StatefulWidget {
  ComplaintWidget({Key key}) : super(key: key);

  @override
  _ComplaintWidgetState createState() => _ComplaintWidgetState();
}

class _ComplaintWidgetState extends State<ComplaintWidget> {
  bool _loadingButton = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final columnUsersRecord = snapshot.data;
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
                      child: Text(
                        'Bu fotoğrafı neden şikayet etmek istiyorsunuz?',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF090F13),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                StreamBuilder<List<ComlaintsListRecord>>(
                  stream: queryComlaintsListRecord(
                    queryBuilder: (comlaintsListRecord) =>
                        comlaintsListRecord.orderBy('no'),
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
                    List<ComlaintsListRecord> listViewComlaintsListRecordList =
                        snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewComlaintsListRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewComlaintsListRecord =
                            listViewComlaintsListRecordList[listViewIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                              ),
                              child: InkWell(
                                onTap: () async {
                                  final complaintsCreateData =
                                      createComplaintsRecordData(
                                    cause: listViewComlaintsListRecord.reason,
                                    createdTime: getCurrentTimestamp,
                                    user: currentUserReference,
                                    username: columnUsersRecord.username,
                                    userEmail: columnUsersRecord.email,
                                  );
                                  await ComplaintsRecord.collection
                                      .doc()
                                      .set(complaintsCreateData);
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(
                                            'Şikayetiniz başarı ile alındı.'),
                                        content: Text(
                                            '24 saat içinde incelenerek gerekli işlem yapılacaktır. Desteğiniz için çok teşekkürler.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Tamam'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Icon(
                                            Icons.blur_on_sharp,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: Text(
                                            listViewComlaintsListRecord.reason,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.9, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xFF95A1AC),
                                          size: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 10, 4, 25),
              child: FFButtonWidget(
                onPressed: () async {
                  setState(() => _loadingButton = true);
                  try {
                    Navigator.pop(context);
                  } finally {
                    setState(() => _loadingButton = false);
                  }
                },
                text: 'İptal',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40,
                  color: Color(0xFF4C3AF3),
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 4,
                ),
                loading: _loadingButton,
              ),
            )
          ],
        );
      },
    );
  }
}
