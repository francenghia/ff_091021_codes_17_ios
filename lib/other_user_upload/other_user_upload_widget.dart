import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/admob_widget.dart';
import '../components/comments_list_widget.dart';
import '../components/complaint_widget.dart';
import '../components/full_view_widget.dart';
import '../components/liked_by_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../other_profil/other_profil_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherUserUploadWidget extends StatefulWidget {
  OtherUserUploadWidget({
    Key key,
    this.postid,
    this.postid2,
  }) : super(key: key);

  final DocumentReference postid;
  final PostsRecord postid2;

  @override
  _OtherUserUploadWidgetState createState() => _OtherUserUploadWidgetState();
}

class _OtherUserUploadWidgetState extends State<OtherUserUploadWidget> {
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
        final otherUserUploadUsersRecord = snapshot.data;
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3A000000),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                        child: StreamBuilder<PostsRecord>(
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
                            final socialFeedPostsRecord = snapshot.data;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 12),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                        userref:
                                                            socialFeedPostsRecord
                                                                .user,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Colors.white,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                1, 1, 1, 1),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      clipBehavior:
                                                          Clip.antiAlias,
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              socialFeedPostsRecord
                                                                  .username,
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF090F13),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              '${socialFeedPostsRecord.il} ${socialFeedPostsRecord.ulke}',
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF090F13),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      buttonSize: 46,
                                                      icon: Icon(
                                                        Icons.keyboard_control,
                                                        color:
                                                            Color(0xFF262D34),
                                                        size: 20,
                                                      ),
                                                      onPressed: () async {
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width,
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
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Visibility(
                                                  visible: socialFeedPostsRecord
                                                          .fotoShow ??
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                    child: Image.network(
                                                      socialFeedPostsRecord
                                                          .photoUrl,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.99, -0.98),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 4, 0),
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
                                                                  1,
                                                              child:
                                                                  FullViewWidget(
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
                                              socialFeedPostsRecord.videoShow ??
                                                  true,
                                          child: FlutterFlowVideoPlayer(
                                            path: socialFeedPostsRecord.video,
                                            videoType: VideoType.network,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            autoPlay: false,
                                            looping: false,
                                            showControls: true,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 4, 8, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 16, 0),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          currentUserReference),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color:
                                                                FlutterFlowTheme
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final likesUsersRecord =
                                                        snapshot.data;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Visibility(
                                                          visible:
                                                              socialFeedPostsRecord
                                                                      .likedBy
                                                                      .contains(
                                                                          currentUserReference) ??
                                                                  true,
                                                          child: InkWell(
                                                            onTap: () async {
                                                              final postsUpdateData =
                                                                  {
                                                                'liked_by':
                                                                    FieldValue
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
                                                                'total_sp':
                                                                    FieldValue
                                                                        .increment(
                                                                            -1),
                                                              };
                                                              await likesUsersRecord
                                                                  .reference
                                                                  .update(
                                                                      usersUpdateData);
                                                            },
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color: Color(
                                                                  0xFFFF0000),
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible:
                                                              !(socialFeedPostsRecord
                                                                      .likedBy
                                                                      .contains(
                                                                          currentUserReference) ??
                                                                  false),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              final postsUpdateData =
                                                                  {
                                                                'liked_by':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                                'num_likes':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
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
                                                                            1),
                                                                'total_sp':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              };
                                                              await likesUsersRecord
                                                                  .reference
                                                                  .update(
                                                                      usersUpdateData);
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Container(
                                                                    height: 140,
                                                                    child:
                                                                        AdmobWidget(),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: Color(
                                                                  0xFF8B97A2),
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      0, 0, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.9,
                                                                    child:
                                                                        LikedByWidget(
                                                                      postid: socialFeedPostsRecord
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
                                                                color: Color(
                                                                    0x00FFFFFF),
                                                              ),
                                                              child: Text(
                                                                socialFeedPostsRecord
                                                                    .numLikes
                                                                    .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme
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
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.9,
                                                        child:
                                                            CommentsListWidget(
                                                          postid:
                                                              socialFeedPostsRecord
                                                                  .reference,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 15, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .mode_comment_outlined,
                                                            color: Color(
                                                                0xFF95A1AC),
                                                            size: 30,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              socialFeedPostsRecord
                                                                  .numOfComments
                                                                  .toString(),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 10, 8, 0),
                                          child: StreamBuilder<
                                              List<CommentsRecord>>(
                                            stream: queryCommentsRecord(
                                              queryBuilder: (commentsRecord) =>
                                                  commentsRecord
                                                      .where('postid',
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: FlutterFlowTheme
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CommentsRecord>
                                                  commentCommentsRecordList =
                                                  snapshot.data;
                                              if (commentCommentsRecordList
                                                  .isEmpty) {
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
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.9,
                                                        child:
                                                            CommentsListWidget(
                                                          postid:
                                                              socialFeedPostsRecord
                                                                  .reference,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: List.generate(
                                                      commentCommentsRecordList
                                                          .length,
                                                      (commentIndex) {
                                                    final commentCommentsRecord =
                                                        commentCommentsRecordList[
                                                            commentIndex];
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .comment,
                                                          color:
                                                              Color(0xFF8B97A2),
                                                          size: 24,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      0, 8, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    AutoSizeText(
                                                                  commentCommentsRecord
                                                                      .comment,
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF8B97A2),
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  '${dateTimeFormat('d/M/y', commentCommentsRecord.createdTime)}-${dateTimeFormat('Hm', commentCommentsRecord.createdTime)} / ${commentCommentsRecord.username}',
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF8B97A2),
                                                                    fontSize:
                                                                        10,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 4, 8, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 10, 4, 0),
                                                  child: Text(
                                                    socialFeedPostsRecord.info,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF090F13),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
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
        );
      },
    );
  }
}
