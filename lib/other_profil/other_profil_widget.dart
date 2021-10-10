import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../other_user_all_uploads/other_user_all_uploads_widget.dart';
import '../other_user_upload/other_user_upload_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherProfilWidget extends StatefulWidget {
  OtherProfilWidget({
    Key key,
    this.userref,
  }) : super(key: key);

  final DocumentReference userref;

  @override
  _OtherProfilWidgetState createState() => _OtherProfilWidgetState();
}

class _OtherProfilWidgetState extends State<OtherProfilWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userref),
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
        final otherProfilUsersRecord = snapshot.data;
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
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: AuthUserStreamWidget(
              child: StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) =>
                      usersRecord.where('email', isEqualTo: currentUserEmail),
                  singleRecord: true,
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
                  List<UsersRecord> columnMeUsersRecordList = snapshot.data;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data.isEmpty) {
                    return Container();
                  }
                  final columnMeUsersRecord = columnMeUsersRecordList.isNotEmpty
                      ? columnMeUsersRecordList.first
                      : null;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: Align(
                                    alignment:
                                        AlignmentDirectional(-0.4, -0.02),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1, 1, 1, 1),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            otherProfilUsersRecord
                                                .profilePicUrl,
                                            'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 2, 0, 0),
                                  child: AutoSizeText(
                                    otherProfilUsersRecord.username,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OtherUserAllUploadsWidget(
                                          otheruserid:
                                              otherProfilUsersRecord.reference,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        otherProfilUsersRecord.totalPosts
                                            .toString(),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 3, 0, 0),
                                        child: Text(
                                          'Paylaşım',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        otherProfilUsersRecord.totalFollower
                                            .toString(),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 3, 0, 0),
                                        child: Text(
                                          'Takipci',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      otherProfilUsersRecord.totalFollow
                                          .toString(),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 3, 0, 0),
                                      child: Text(
                                        'Takip',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                        child: StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .where('email', isEqualTo: currentUserEmail),
                            singleRecord: true,
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
                            List<UsersRecord> columnUsersRecordList =
                                snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final columnUsersRecord =
                                columnUsersRecordList.isNotEmpty
                                    ? columnUsersRecordList.first
                                    : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Visibility(
                                  visible: !(columnMeUsersRecord.followList
                                          .contains(widget.userref) ??
                                      false),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 18, 8, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => _loadingButton1 = true);
                                        try {
                                          final followsCreateData =
                                              createFollowsRecordData(
                                            follower: currentUserReference,
                                            following: widget.userref,
                                            followerProfilePic:
                                                columnMeUsersRecord
                                                    .profilePicUrl,
                                            followingProfilePic:
                                                otherProfilUsersRecord
                                                    .profilePicUrl,
                                            email: currentUserEmail,
                                            createdTime: getCurrentTimestamp,
                                            userRef: currentUserReference,
                                            followerName:
                                                columnMeUsersRecord.username,
                                            followingName:
                                                otherProfilUsersRecord.username,
                                          );
                                          await FollowsRecord.collection
                                              .doc()
                                              .set(followsCreateData);
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Takip Ekle'),
                                                content: Text(
                                                    'Bu kullanıcıyı takip edeceksiniz...'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('    '),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      Navigator.pop(
                                                          alertDialogContext);

                                                      final usersUpdateData = {
                                                        'total_follow':
                                                            FieldValue
                                                                .increment(1),
                                                        'follow_list':
                                                            FieldValue
                                                                .arrayUnion([
                                                          widget.userref
                                                        ]),
                                                      };
                                                      await currentUserReference
                                                          .update(
                                                              usersUpdateData);
                                                      ;
                                                    },
                                                    child: Text('Tamam'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          final usersUpdateData = {
                                            'total_follower':
                                                FieldValue.increment(1),
                                          };
                                          await otherProfilUsersRecord.reference
                                              .update(usersUpdateData);
                                        } finally {
                                          setState(
                                              () => _loadingButton1 = false);
                                        }
                                      },
                                      text: 'Takip Et',
                                      icon: Icon(
                                        Icons.add,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 46,
                                        color: Color(0xFF4B39F0),
                                        textStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                        borderSide: BorderSide(
                                          color: Color(0x8BF1F1F1),
                                          width: 1,
                                        ),
                                        borderRadius: 4,
                                      ),
                                      loading: _loadingButton1,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: columnMeUsersRecord.followList
                                          .contains(widget.userref) ??
                                      true,
                                  child: StreamBuilder<List<FollowsRecord>>(
                                    stream: queryFollowsRecord(
                                      queryBuilder: (followsRecord) =>
                                          followsRecord
                                              .where(
                                                  'following',
                                                  isEqualTo: widget.userref)
                                              .where(
                                                  'follower',
                                                  isEqualTo: columnMeUsersRecord
                                                      .reference),
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
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<FollowsRecord> rowFollowsRecordList =
                                          snapshot.data;
                                      if (rowFollowsRecordList.isEmpty) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/beyaz.png',
                                            width: 0,
                                            height: 0,
                                          ),
                                        );
                                      }
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            rowFollowsRecordList.length,
                                            (rowIndex) {
                                          final rowFollowsRecord =
                                              rowFollowsRecordList[rowIndex];
                                          return Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 18, 8, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() =>
                                                      _loadingButton2 = true);
                                                  try {
                                                    await rowFollowsRecord
                                                        .reference
                                                        .delete();
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Takip Ekle'),
                                                          content: Text(
                                                              'Bu kullanıcıyı takipten çıkıyorsunuz...'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child:
                                                                  Text('    '),
                                                            ),
                                                            TextButton(
                                                              onPressed:
                                                                  () async {
                                                                Navigator.pop(
                                                                    alertDialogContext);

                                                                final usersUpdateData =
                                                                    {
                                                                  'total_follow':
                                                                      FieldValue
                                                                          .increment(
                                                                              -1),
                                                                  'follow_list':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    widget
                                                                        .userref
                                                                  ]),
                                                                };
                                                                await currentUserReference
                                                                    .update(
                                                                        usersUpdateData);
                                                                ;
                                                              },
                                                              child:
                                                                  Text('Tamam'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    final usersUpdateData = {
                                                      'total_follower':
                                                          FieldValue.increment(
                                                              -1),
                                                    };
                                                    await otherProfilUsersRecord
                                                        .reference
                                                        .update(
                                                            usersUpdateData);
                                                  } finally {
                                                    setState(() =>
                                                        _loadingButton2 =
                                                            false);
                                                  }
                                                },
                                                text: 'Takipte',
                                                icon: Icon(
                                                  Icons.check_circle_rounded,
                                                  size: 15,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 46,
                                                  color: Color(0xFF208E83),
                                                  textStyle: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Color(0x8BF1F1F1),
                                                    width: 1,
                                                  ),
                                                  borderRadius: 4,
                                                ),
                                                loading: _loadingButton2,
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              TabBar(
                                labelColor: FlutterFlowTheme.primaryColor,
                                indicatorColor: Color(0xB4000000),
                                tabs: [
                                  Tab(
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Color(0xB4000000),
                                      size: 26,
                                    ),
                                  ),
                                  Tab(
                                    icon: Icon(
                                      Icons.videocam,
                                      color: Color(0xB4000000),
                                      size: 26,
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 8, 10),
                                            child: StreamBuilder<
                                                List<PostsRecord>>(
                                              stream: queryPostsRecord(
                                                queryBuilder: (postsRecord) =>
                                                    postsRecord
                                                        .where('user',
                                                            isEqualTo:
                                                                otherProfilUsersRecord
                                                                    .reference)
                                                        .where('foto_show',
                                                            isEqualTo: true)
                                                        .where('deleted',
                                                            isEqualTo: false)
                                                        .orderBy('created_time',
                                                            descending: true),
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
                                                List<PostsRecord>
                                                    gridViewPostsRecordList =
                                                    snapshot.data;
                                                if (gridViewPostsRecordList
                                                    .isEmpty) {
                                                  return Center(
                                                    child: Image.asset(
                                                      'assets/images/beyaz.png',
                                                      width: 0,
                                                      height: 0,
                                                    ),
                                                  );
                                                }
                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 0,
                                                    mainAxisSpacing: 0,
                                                    childAspectRatio: 1,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      gridViewPostsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, gridViewIndex) {
                                                    final gridViewPostsRecord =
                                                        gridViewPostsRecordList[
                                                            gridViewIndex];
                                                    return Container(
                                                      width: 150,
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                      ),
                                                      child: Container(
                                                        width: 150,
                                                        height: 150,
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          2,
                                                                          2),
                                                              child:
                                                                  Image.network(
                                                                gridViewPostsRecord
                                                                    .imageUrl,
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.85,
                                                                      -0.85),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              OtherUserUploadWidget(
                                                                        postid:
                                                                            gridViewPostsRecord.reference,
                                                                        postid2:
                                                                            gridViewPostsRecord,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .fullscreen,
                                                                  color: Color(
                                                                      0xD8FFFFFF),
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 8, 10),
                                            child: StreamBuilder<
                                                List<PostsRecord>>(
                                              stream: queryPostsRecord(
                                                queryBuilder: (postsRecord) =>
                                                    postsRecord
                                                        .where('user',
                                                            isEqualTo:
                                                                otherProfilUsersRecord
                                                                    .reference)
                                                        .where('video_show',
                                                            isEqualTo: true)
                                                        .where('deleted',
                                                            isEqualTo: false)
                                                        .orderBy('created_time',
                                                            descending: true),
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
                                                List<PostsRecord>
                                                    gridViewPostsRecordList =
                                                    snapshot.data;
                                                if (gridViewPostsRecordList
                                                    .isEmpty) {
                                                  return Center(
                                                    child: Image.asset(
                                                      'assets/images/beyaz.png',
                                                      width: 0,
                                                      height: 0,
                                                    ),
                                                  );
                                                }
                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 0,
                                                    mainAxisSpacing: 0,
                                                    childAspectRatio: 1,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      gridViewPostsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, gridViewIndex) {
                                                    final gridViewPostsRecord =
                                                        gridViewPostsRecordList[
                                                            gridViewIndex];
                                                    return Container(
                                                      width: 150,
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2,
                                                                        0,
                                                                        2,
                                                                        2),
                                                            child:
                                                                FlutterFlowVideoPlayer(
                                                              path:
                                                                  gridViewPostsRecord
                                                                      .video,
                                                              videoType:
                                                                  VideoType
                                                                      .network,
                                                              width: 150,
                                                              height: 150,
                                                              autoPlay: false,
                                                              looping: true,
                                                              showControls:
                                                                  true,
                                                              allowFullScreen:
                                                                  true,
                                                              allowPlaybackSpeedMenu:
                                                                  false,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.85,
                                                                    -0.85),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            OtherUserUploadWidget(
                                                                      postid: gridViewPostsRecord
                                                                          .reference,
                                                                      postid2:
                                                                          gridViewPostsRecord,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .fullscreen,
                                                                color: Color(
                                                                    0xD8FFFFFF),
                                                                size: 24,
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
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
