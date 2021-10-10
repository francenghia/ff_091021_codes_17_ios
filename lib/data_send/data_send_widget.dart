import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../data_send_ekle/data_send_ekle_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataSendWidget extends StatefulWidget {
  DataSendWidget({Key key}) : super(key: key);

  @override
  _DataSendWidgetState createState() => _DataSendWidgetState();
}

class _DataSendWidgetState extends State<DataSendWidget> {
  TextEditingController userIdController;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: TextFormField(
                      controller: userIdController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'id gir',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.primaryColor,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.primaryColor,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataSendEkleWidget(
                            id: userIdController.text,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.05, 0.1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: FutureBuilder<dynamic>(
                  future: algPostCall(
                    id: userIdController.text,
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
                    final columnAlgPostResponse = snapshot.data;
                    return Builder(
                      builder: (context) {
                        final data11 =
                            getJsonField(columnAlgPostResponse, r'''$.hits''')
                                    ?.toList() ??
                                [];
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(data11.length, (data11Index) {
                              final data11Item = data11[data11Index];
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      getJsonField(
                                              data11Item, r'''$.username''')
                                          .toString(),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                      ),
                                    ),
                                    StreamBuilder<List<PostsRecord>>(
                                      stream: queryPostsRecord(
                                        queryBuilder: (postsRecord) =>
                                            postsRecord.where('objectID',
                                                isEqualTo: getJsonField(
                                                        data11Item,
                                                        r'''$.objectID''')
                                                    .toString()),
                                        limit: 1,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<PostsRecord> rowPostsRecordList =
                                            snapshot.data;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              rowPostsRecordList.length,
                                              (rowIndex) {
                                            final rowPostsRecord =
                                                rowPostsRecordList[rowIndex];
                                            return Text(
                                              rowPostsRecord.objectID,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                    AuthUserStreamWidget(
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where('email',
                                                  isEqualTo: currentUserEmail),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              buttonUsersRecordList =
                                              snapshot.data;
                                          // Return an empty Container when the document does not exist.
                                          if (snapshot.data.isEmpty) {
                                            return Container();
                                          }
                                          final buttonUsersRecord =
                                              buttonUsersRecordList.isNotEmpty
                                                  ? buttonUsersRecordList.first
                                                  : null;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              setState(
                                                  () => _loadingButton = true);
                                              try {
                                                final postsCreateData =
                                                    createPostsRecordData(
                                                  username: getJsonField(
                                                          data11Item,
                                                          r'''$.username''')
                                                      .toString(),
                                                  numLikes: 0,
                                                  location: getJsonField(
                                                          data11Item,
                                                          r'''$.ulke''')
                                                      .toString(),
                                                  il: getJsonField(data11Item,
                                                          r'''$.il''')
                                                      .toString(),
                                                  ilce: getJsonField(data11Item,
                                                          r'''$.ilce''')
                                                      .toString(),
                                                  ulke: getJsonField(data11Item,
                                                          r'''$.ulke''')
                                                      .toString(),
                                                  imageUrl: getJsonField(
                                                      data11Item,
                                                      r'''$.foto'''),
                                                  user: currentUserReference,
                                                  fotoShow: true,
                                                  videoShow: false,
                                                  videoLink: getJsonField(
                                                          data11Item,
                                                          r'''$.video_link''')
                                                      .toString(),
                                                  userProfilePic:
                                                      'https://res.cloudinary.com/meeelingo/image/upload/v1629466740/ug8jeve1s4v24uwzkfvs.jpg',
                                                  displayName: getJsonField(
                                                          data11Item,
                                                          r'''$.username''')
                                                      .toString(),
                                                  photoUrl: getJsonField(
                                                      data11Item,
                                                      r'''$.foto'''),
                                                  uid: currentUserUid,
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  info: getJsonField(data11Item,
                                                          r'''$.Aciklama''')
                                                      .toString(),
                                                  tag: getJsonField(data11Item,
                                                          r'''$.tags''')
                                                      .toString(),
                                                  email: '',
                                                  deleted: false,
                                                  objectID: getJsonField(
                                                          data11Item,
                                                          r'''$.objectID''')
                                                      .toString(),
                                                );
                                                await PostsRecord.collection
                                                    .doc()
                                                    .set(postsCreateData);

                                                final usersUpdateData = {
                                                  'total_posts':
                                                      FieldValue.increment(1),
                                                };
                                                await buttonUsersRecord
                                                    .reference
                                                    .update(usersUpdateData);
                                              } finally {
                                                setState(() =>
                                                    _loadingButton = false);
                                              }
                                            },
                                            text: 'ok',
                                            options: FFButtonOptions(
                                              width: 100,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              textStyle: FlutterFlowTheme
                                                  .subtitle2
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 2,
                                            ),
                                            loading: _loadingButton,
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
