import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/deleteconfirm_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoSilWidget extends StatefulWidget {
  PhotoSilWidget({
    Key key,
    this.postid,
  }) : super(key: key);

  final DocumentReference postid;

  @override
  _PhotoSilWidgetState createState() => _PhotoSilWidgetState();
}

class _PhotoSilWidgetState extends State<PhotoSilWidget> {
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        final photoSilPostsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              'Paylaşım',
              style: FlutterFlowTheme.title2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF090F13),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  buttonSize: 48,
                  icon: Icon(
                    Icons.close_rounded,
                    color: Color(0xFF95A1AC),
                    size: 30,
                  ),
                  onPressed: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NavBarPage(initialPage: 'my_profil'),
                      ),
                      (r) => false,
                    );
                  },
                ),
              )
            ],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
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
                final columnCurrentUserUsersRecord = snapshot.data;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Katıldığınız Yarışmalar',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(
                            height: 2,
                            thickness: 2,
                            indent: 4,
                            endIndent: 4,
                            color: Color(0xFF9A9A9A),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                            child: StreamBuilder<List<ContestRecord>>(
                              stream: queryContestRecord(
                                queryBuilder: (contestRecord) =>
                                    contestRecord.where('attendies',
                                        arrayContains: widget.postid),
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
                                List<ContestRecord>
                                    storeListViewContestRecordList =
                                    snapshot.data;
                                if (storeListViewContestRecordList.isEmpty) {
                                  return Center(
                                    child: Image.asset(
                                      'assets/images/icons8-no-image-gallery-100.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  );
                                }
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      storeListViewContestRecordList.length,
                                      (storeListViewIndex) {
                                    final storeListViewContestRecord =
                                        storeListViewContestRecordList[
                                            storeListViewIndex];
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    storeListViewContestRecord
                                                        .foto,
                                                    width: 74,
                                                    height: 74,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 1, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        storeListViewContestRecord
                                                            .subject,
                                                        style: FlutterFlowTheme
                                                            .subtitle1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF15212B),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Bitiş: ${dateTimeFormat('d/M/y', storeListViewContestRecord.endDate)}',
                                                        style: FlutterFlowTheme
                                                            .bodyText2
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF8B97A2),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      final contestUpdateData =
                                                          {
                                                        'attendies': FieldValue
                                                            .arrayRemove([
                                                          widget.postid
                                                        ]),
                                                        'num_of_contestant':
                                                            FieldValue
                                                                .increment(-1),
                                                      };
                                                      await storeListViewContestRecord
                                                          .reference
                                                          .update(
                                                              contestUpdateData);

                                                      final postsUpdateData = {
                                                        'attendant_contest':
                                                            FieldValue
                                                                .arrayRemove([
                                                          storeListViewContestRecord
                                                              .reference
                                                        ]),
                                                      };
                                                      await photoSilPostsRecord
                                                          .reference
                                                          .update(
                                                              postsUpdateData);

                                                      final usersUpdateData = {
                                                        'contest_refs':
                                                            FieldValue
                                                                .arrayRemove([
                                                          storeListViewContestRecord
                                                              .reference
                                                        ]),
                                                      };
                                                      await currentUserReference
                                                          .update(
                                                              usersUpdateData);
                                                    },
                                                    child: Icon(
                                                      Icons.delete_forever,
                                                      color: Color(0xFFFF0000),
                                                      size: 32,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 16, 8, 32),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton = true);
                          try {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) {
                                return DeleteconfirmWidget(
                                  postid: widget.postid,
                                );
                              },
                            );
                          } finally {
                            setState(() => _loadingButton = false);
                          }
                        },
                        text: 'Paylaşımı Sil',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60,
                          color: Color(0xFF4B39EF),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                        loading: _loadingButton,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
