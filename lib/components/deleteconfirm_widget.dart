import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteconfirmWidget extends StatefulWidget {
  DeleteconfirmWidget({
    Key key,
    this.postid,
  }) : super(key: key);

  final DocumentReference postid;

  @override
  _DeleteconfirmWidgetState createState() => _DeleteconfirmWidgetState();
}

class _DeleteconfirmWidgetState extends State<DeleteconfirmWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostsRecord>(
      stream: PostsRecord.getDocument(widget.postid),
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
        final containerPostsRecord = snapshot.data;
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: StreamBuilder<UsersRecord>(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'UYARI !',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          child: Text(
                            'Silmek istediğiniz paylaşımınız eğer yarışmalara katıldı ise yarışmalardan da silmeniz gerekli aksi halde paylaşımınız yarışmalarda gösterilmeye devam edecektir.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
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
                                final usersUpdateData = {
                                  'total_posts': FieldValue.increment(-1),
                                };
                                await columnUsersRecord.reference
                                    .update(usersUpdateData);

                                final postsUpdateData = createPostsRecordData(
                                  deleted: true,
                                  createdTime: getCurrentTimestamp,
                                );
                                await containerPostsRecord.reference
                                    .update(postsUpdateData);
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'my_profil'),
                                  ),
                                  (r) => false,
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
                            loading: _loadingButton2,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
