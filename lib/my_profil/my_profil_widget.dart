import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/followers_widget.dart';
import '../components/followings_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../foto_update/foto_update_widget.dart';
import '../profile_update/profile_update_widget.dart';
import '../video_update_y/video_update_y_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfilWidget extends StatefulWidget {
  MyProfilWidget({Key key}) : super(key: key);

  @override
  _MyProfilWidgetState createState() => _MyProfilWidgetState();
}

class _MyProfilWidgetState extends State<MyProfilWidget> {
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                List<UsersRecord> columnUsersRecordList = snapshot.data;
                // Return an empty Container when the document does not exist.
                if (snapshot.data.isEmpty) {
                  return Container();
                }
                final columnUsersRecord = columnUsersRecordList.isNotEmpty
                    ? columnUsersRecordList.first
                    : null;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  'ShootPoints: ',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 2),
                                child: Container(
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF930505),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 4, 0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          columnUsersRecord.totalSp.toString(),
                                          '0',
                                        ),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileUpdateWidget(),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.menu_rounded,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-0.4, -0.02),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      columnUsersRecord.profilePicUrl,
                                      'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        columnUsersRecord.totalPosts.toString(),
                                        '0',
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Roboto',
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
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.9,
                                            child: FollowersWidget(),
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            columnUsersRecord.totalFollower
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 3, 0, 0),
                                          child: Text(
                                            'Takipci',
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
                                ),
                                InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.9,
                                          child: FollowingsWidget(),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          columnUsersRecord.totalFollow
                                              .toString(),
                                          '0',
                                        ),
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
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.55,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    columnUsersRecord.username,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 24, 8, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton = true);
                          try {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileUpdateWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton = false);
                          }
                        },
                        text: 'Profilini Güncelle',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 46,
                          color: Color(0xFF090F13),
                          textStyle: FlutterFlowTheme.subtitle1.override(
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
                          borderRadius: 4,
                        ),
                        loading: _loadingButton,
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
                                          child:
                                              StreamBuilder<List<PostsRecord>>(
                                            stream: queryPostsRecord(
                                              queryBuilder: (postsRecord) =>
                                                  postsRecord
                                                      .where('user',
                                                          isEqualTo:
                                                              currentUserReference)
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
                                                return Image.asset(
                                                  'assets/images/beyaz.png',
                                                  width: 0,
                                                  height: 0,
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
                                                scrollDirection: Axis.vertical,
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
                                                      color: Color(0xFFEEEEEE),
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
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  gridViewPostsRecord
                                                                      .imageUrl,
                                                              width: 200,
                                                              height: 200,
                                                              fit: BoxFit.cover,
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
                                                                            FotoUpdateWidget(
                                                                      postid: gridViewPostsRecord
                                                                          .reference,
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
                                          child:
                                              StreamBuilder<List<PostsRecord>>(
                                            stream: queryPostsRecord(
                                              queryBuilder: (postsRecord) =>
                                                  postsRecord
                                                      .where('user',
                                                          isEqualTo:
                                                              currentUserReference)
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
                                                return Image.asset(
                                                  'assets/images/beyaz.png',
                                                  width: 0,
                                                  height: 0,
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
                                                scrollDirection: Axis.vertical,
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
                                                      color: Color(0xFFEEEEEE),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      0, 2, 2),
                                                          child:
                                                              FlutterFlowVideoPlayer(
                                                            path:
                                                                gridViewPostsRecord
                                                                    .video,
                                                            videoType: VideoType
                                                                .network,
                                                            width: 200,
                                                            height: 200,
                                                            autoPlay: false,
                                                            looping: true,
                                                            showControls: true,
                                                            allowFullScreen:
                                                                true,
                                                            allowPlaybackSpeedMenu:
                                                                false,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.85, -0.85),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          VideoUpdateYWidget(
                                                                    postid: gridViewPostsRecord
                                                                        .reference,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons.fullscreen,
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
      ),
    );
  }
}
