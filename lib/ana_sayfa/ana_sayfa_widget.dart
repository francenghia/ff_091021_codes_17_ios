import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/admob_widget.dart';
import '../components/comments_list_widget.dart';
import '../components/complaint_widget.dart';
import '../components/full_view_widget.dart';
import '../components/liked_by_widget.dart';
import '../components/upload_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../other_profil/other_profil_widget.dart';
import '../profile_update/profile_update_widget.dart';
import '../user_search/user_search_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AnaSayfaWidget extends StatefulWidget {
  AnaSayfaWidget({Key key}) : super(key: key);

  @override
  _AnaSayfaWidgetState createState() => _AnaSayfaWidgetState();
}

class _AnaSayfaWidgetState extends State<AnaSayfaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        final anaSayfaUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            leading: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserSearchWidget(),
                    ),
                  );
                },
                child: Icon(
                  Icons.search,
                  color: Color(0xFF5B5B5B),
                  size: 24,
                ),
              ),
            ),
            title: Image.asset(
              'assets/images/SP_LOGO.png',
              width: 150,
              height: 30,
              fit: BoxFit.contain,
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileUpdateWidget(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.menu,
                    color: Color(0xFF5B5B5B),
                    size: 24,
                  ),
                ),
              )
            ],
            centerTitle: true,
            elevation: 4,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Container(
                    height: 250,
                    child: UploadWidget(),
                  );
                },
              );
            },
            backgroundColor: FlutterFlowTheme.primaryColor,
            elevation: 8,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            ),
          ),
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                              child: StreamBuilder<List<FollowsRecord>>(
                                stream: queryFollowsRecord(
                                  queryBuilder: (followsRecord) => followsRecord
                                      .where('follower',
                                          isEqualTo:
                                              anaSayfaUsersRecord.reference)
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
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<FollowsRecord> rowFollowsRecordList =
                                      snapshot.data;
                                  if (rowFollowsRecordList.isEmpty) {
                                    return Image.asset(
                                      'assets/images/beyaz.png',
                                      width: 0,
                                      height: 0,
                                    );
                                  }
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          rowFollowsRecordList.length,
                                          (rowIndex) {
                                        final rowFollowsRecord =
                                            rowFollowsRecordList[rowIndex];
                                        return InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    OtherProfilWidget(
                                                  userref: rowFollowsRecord
                                                      .following,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFF5F5F5),
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: Container(
                                                  width: 70,
                                                  height: 70,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      rowFollowsRecord
                                                          .followingProfilePic,
                                                      'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                rowFollowsRecord.followingName,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontSize: 10,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                            StreamBuilder<List<FollowsRecord>>(
                              stream: queryFollowsRecord(
                                queryBuilder: (followsRecord) =>
                                    followsRecord.where('follower',
                                        isEqualTo:
                                            anaSayfaUsersRecord.reference),
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
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<FollowsRecord> rowFollowsRecordList =
                                    snapshot.data;
                                if (rowFollowsRecordList.isEmpty) {
                                  return Image.asset(
                                    'assets/images/beyaz.png',
                                    width: 0,
                                    height: 0,
                                  );
                                }
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserSearchWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowFollowsRecordList.length,
                                        (rowIndex) {
                                      final rowFollowsRecord =
                                          rowFollowsRecordList[rowIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFFF5F5F5),
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Ekle',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              fontSize: 10,
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<FollowsRecord>>(
                              stream: queryFollowsRecord(
                                queryBuilder: (followsRecord) =>
                                    followsRecord.where('follower',
                                        isEqualTo:
                                            anaSayfaUsersRecord.reference),
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
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<FollowsRecord> rowFollowsRecordList =
                                    snapshot.data;
                                if (rowFollowsRecordList.isEmpty) {
                                  return Image.asset(
                                    'assets/images/beyaz.png',
                                    width: 0,
                                    height: 0,
                                  );
                                }
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserSearchWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowFollowsRecordList.length,
                                        (rowIndex) {
                                      final rowFollowsRecord =
                                          rowFollowsRecordList[rowIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFFF5F5F5),
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Ekle',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              fontSize: 10,
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<FollowsRecord>>(
                              stream: queryFollowsRecord(
                                queryBuilder: (followsRecord) =>
                                    followsRecord.where('follower',
                                        isEqualTo:
                                            anaSayfaUsersRecord.reference),
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
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<FollowsRecord> rowFollowsRecordList =
                                    snapshot.data;
                                if (rowFollowsRecordList.isEmpty) {
                                  return Image.asset(
                                    'assets/images/beyaz.png',
                                    width: 0,
                                    height: 0,
                                  );
                                }
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserSearchWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowFollowsRecordList.length,
                                        (rowIndex) {
                                      final rowFollowsRecord =
                                          rowFollowsRecordList[rowIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFFF5F5F5),
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Ekle',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              fontSize: 10,
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<FollowsRecord>>(
                              stream: queryFollowsRecord(
                                queryBuilder: (followsRecord) =>
                                    followsRecord.where('follower',
                                        isEqualTo:
                                            anaSayfaUsersRecord.reference),
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
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<FollowsRecord> rowFollowsRecordList =
                                    snapshot.data;
                                if (rowFollowsRecordList.isEmpty) {
                                  return Image.asset(
                                    'assets/images/beyaz.png',
                                    width: 0,
                                    height: 0,
                                  );
                                }
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserSearchWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowFollowsRecordList.length,
                                        (rowIndex) {
                                      final rowFollowsRecord =
                                          rowFollowsRecordList[rowIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFFF5F5F5),
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Ekle',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              fontSize: 10,
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<FollowsRecord>>(
                              stream: queryFollowsRecord(
                                queryBuilder: (followsRecord) =>
                                    followsRecord.where('follower',
                                        isEqualTo:
                                            anaSayfaUsersRecord.reference),
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
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<FollowsRecord> rowFollowsRecordList =
                                    snapshot.data;
                                if (rowFollowsRecordList.isEmpty) {
                                  return Image.asset(
                                    'assets/images/beyaz.png',
                                    width: 0,
                                    height: 0,
                                  );
                                }
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserSearchWidget(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowFollowsRecordList.length,
                                        (rowIndex) {
                                      final rowFollowsRecord =
                                          rowFollowsRecordList[rowIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFFF5F5F5),
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Ekle',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              fontSize: 10,
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                  child: StreamBuilder<List<PostsRecord>>(
                    stream: queryPostsRecord(
                      queryBuilder: (postsRecord) => postsRecord
                          .where('deleted', isEqualTo: false)
                          .where('created_time',
                              isLessThan: getCurrentTimestamp)
                          .orderBy('created_time', descending: true),
                      limit: 100,
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
                      List<PostsRecord> socialFeedPostsRecordList =
                          snapshot.data;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(socialFeedPostsRecordList.length,
                                (socialFeedIndex) {
                          final socialFeedPostsRecord =
                              socialFeedPostsRecordList[socialFeedIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 2, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    OtherProfilWidget(
                                                  userref: socialFeedPostsRecord
                                                      .user,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Colors.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 1, 1, 1),
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  socialFeedPostsRecord
                                                      .userProfilePic,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OtherProfilWidget(
                                                        userref:
                                                            socialFeedPostsRecord
                                                                .user,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: Text(
                                                        socialFeedPostsRecord
                                                            .username,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: Text(
                                                        socialFeedPostsRecord
                                                            .location,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                buttonSize: 46,
                                                icon: Icon(
                                                  Icons.keyboard_control,
                                                  color: Color(0xFF262D34),
                                                  size: 20,
                                                ),
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.9,
                                                        child:
                                                            ComplaintWidget(),
                                                      );
                                                    },
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 6,
                                            color: Color(0x3A000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Visibility(
                                            visible: socialFeedPostsRecord
                                                    .fotoShow ??
                                                true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              child: CachedNetworkImage(
                                                imageUrl: socialFeedPostsRecord
                                                    .imageUrl,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.99, -0.98),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 4, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            1,
                                                        child: FullViewWidget(
                                                          image:
                                                              socialFeedPostsRecord
                                                                  .photoUrl,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.fullscreen,
                                                  color: Colors.white,
                                                  size: 36,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        socialFeedPostsRecord.videoShow ?? true,
                                    child: FlutterFlowVideoPlayer(
                                      path: socialFeedPostsRecord.video,
                                      videoType: VideoType.network,
                                      width: MediaQuery.of(context).size.width,
                                      autoPlay: false,
                                      looping: false,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 4, 8, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 16, 0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                socialFeedPostsRecord.user),
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
                                              final likesUsersRecord =
                                                  snapshot.data;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Visibility(
                                                    visible: socialFeedPostsRecord
                                                            .likedBy
                                                            .contains(
                                                                currentUserReference) ??
                                                        true,
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final postsUpdateData =
                                                            {
                                                          'liked_by': FieldValue
                                                              .arrayRemove([
                                                            currentUserReference
                                                          ]),
                                                          'num_likes':
                                                              FieldValue
                                                                  .increment(
                                                                      -1),
                                                        };
                                                        await socialFeedPostsRecord
                                                            .reference
                                                            .update(
                                                                postsUpdateData);

                                                        final usersUpdateData =
                                                            {
                                                          'total_like':
                                                              FieldValue
                                                                  .increment(
                                                                      -1),
                                                          'total_sp': FieldValue
                                                              .increment(-1),
                                                        };
                                                        await likesUsersRecord
                                                            .reference
                                                            .update(
                                                                usersUpdateData);
                                                      },
                                                      child: Icon(
                                                        Icons.favorite,
                                                        color:
                                                            Color(0xFFFF0000),
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: !(socialFeedPostsRecord
                                                            .likedBy
                                                            .contains(
                                                                currentUserReference) ??
                                                        false),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final postsUpdateData =
                                                            {
                                                          'liked_by': FieldValue
                                                              .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                          'num_likes':
                                                              FieldValue
                                                                  .increment(1),
                                                        };
                                                        await socialFeedPostsRecord
                                                            .reference
                                                            .update(
                                                                postsUpdateData);

                                                        final usersUpdateData =
                                                            {
                                                          'total_like':
                                                              FieldValue
                                                                  .increment(1),
                                                          'total_sp': FieldValue
                                                              .increment(1),
                                                        };
                                                        await likesUsersRecord
                                                            .reference
                                                            .update(
                                                                usersUpdateData);
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          context: context,
                                                          builder: (context) {
                                                            return Container(
                                                              height: 140,
                                                              child:
                                                                  AdmobWidget(),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xFF8B97A2),
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 0, 0, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          context: context,
                                                          builder: (context) {
                                                            return Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.9,
                                                              child:
                                                                  LikedByWidget(
                                                                postid:
                                                                    socialFeedPostsRecord
                                                                        .reference,
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            socialFeedPostsRecord
                                                                .numLikes
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText2
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF8B97A2),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
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
                                                  child: CommentsListWidget(
                                                    postid:
                                                        socialFeedPostsRecord
                                                            .reference,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 15, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .mode_comment_outlined,
                                                      color: Color(0xFF95A1AC),
                                                      size: 30,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          socialFeedPostsRecord
                                                              .numOfComments
                                                              .toString(),
                                                          '0',
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .bodyText2
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF8B97A2),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: AutoSizeText(
                                              socialFeedPostsRecord.info,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 10, 8, 0),
                                    child: StreamBuilder<List<CommentsRecord>>(
                                      stream: queryCommentsRecord(
                                        queryBuilder: (commentsRecord) =>
                                            commentsRecord
                                                .where(
                                                    'postid',
                                                    isEqualTo:
                                                        socialFeedPostsRecord
                                                            .reference)
                                                .orderBy('created_time',
                                                    descending: true),
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
                                        List<CommentsRecord>
                                            commentCommentsRecordList =
                                            snapshot.data;
                                        if (commentCommentsRecordList.isEmpty) {
                                          return Image.asset(
                                            'assets/images/beyaz.png',
                                            width: 0,
                                            height: 0,
                                          );
                                        }
                                        return InkWell(
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
                                                  child: CommentsListWidget(
                                                    postid:
                                                        socialFeedPostsRecord
                                                            .reference,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: List.generate(
                                                commentCommentsRecordList
                                                    .length, (commentIndex) {
                                              final commentCommentsRecord =
                                                  commentCommentsRecordList[
                                                      commentIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.comment,
                                                    color: Color(0xFF8B97A2),
                                                    size: 24,
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Text(
                                                          commentCommentsRecord
                                                              .comment,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF8B97A2),
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Text(
                                                          '${dateTimeFormat('d/M/y', commentCommentsRecord.createdTime)}-${dateTimeFormat('Hm', commentCommentsRecord.createdTime)} / ${commentCommentsRecord.username}',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Color(
                                                                0xFF8B97A2),
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
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
        );
      },
    );
  }
}
