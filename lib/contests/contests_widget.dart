import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/full_view_widget.dart';
import '../contest_uploads2/contest_uploads2_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../my_uploads/my_uploads_widget.dart';
import '../other_profil/other_profil_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContestsWidget extends StatefulWidget {
  ContestsWidget({Key key}) : super(key: key);

  @override
  _ContestsWidgetState createState() => _ContestsWidgetState();
}

class _ContestsWidgetState extends State<ContestsWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Color(0xFF5B5B5B),
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'Aktif Yarışmalar',
                      icon: Icon(
                        Icons.timer,
                        color: Color(0xFF5B5B5B),
                      ),
                    ),
                    Tab(
                      text: 'Kazananlar',
                      icon: Icon(
                        Icons.star_outline,
                        color: Color(0xFF5B5B5B),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: StreamBuilder<List<ContestRecord>>(
                          stream: queryContestRecord(
                            queryBuilder: (contestRecord) =>
                                contestRecord.orderBy('no'),
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
                            List<ContestRecord> socialFeedContestRecordList =
                                snapshot.data;
                            if (socialFeedContestRecordList.isEmpty) {
                              return Center(
                                child: Image.asset(
                                  'assets/images/beyaz.png',
                                  width: 0,
                                  height: 0,
                                ),
                              );
                            }
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                    socialFeedContestRecordList.length,
                                    (socialFeedIndex) {
                                  final socialFeedContestRecord =
                                      socialFeedContestRecordList[
                                          socialFeedIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 16),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 250,
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ContestUploads2Widget(
                                                          contestid:
                                                              socialFeedContestRecord
                                                                  .reference,
                                                          costestname:
                                                              socialFeedContestRecord
                                                                  .subject,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      socialFeedContestRecord
                                                          .foto,
                                                      'https://res.cloudinary.com/meeelingo/image/upload/v1616585427/yarismalar/kedi_blur.jpg',
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 250,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 16, 16, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          socialFeedContestRecord
                                                              .subject,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .title1
                                                                  .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.black,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .chevron_right_rounded,
                                                        color: Colors.black,
                                                        size: 24,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -10.14, -0.58),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 4, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'By Shootpoints',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText2
                                                                    .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color: Color(
                                                                  0xFF4B39EF),
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
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0.88),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 0, 16, 0),
                                                    child: StreamBuilder<
                                                        UsersRecord>(
                                                      stream: UsersRecord
                                                          .getDocument(
                                                              currentUserReference),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        final rowBottomSectionUsersRecord =
                                                            snapshot.data;
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Visibility(
                                                              visible: !(rowBottomSectionUsersRecord
                                                                      .contestRefs
                                                                      .contains(
                                                                          socialFeedContestRecord
                                                                              .reference) ??
                                                                  false),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  setState(() =>
                                                                      _loadingButton1 =
                                                                          true);
                                                                  try {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                MyUploadsWidget(
                                                                          contestuid:
                                                                              socialFeedContestRecord.reference,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  } finally {
                                                                    setState(() =>
                                                                        _loadingButton1 =
                                                                            false);
                                                                  }
                                                                },
                                                                text: 'Katıl',
                                                                icon: Icon(
                                                                  Icons
                                                                      .add_rounded,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 15,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 120,
                                                                  height: 40,
                                                                  color: Color(
                                                                      0xFF4B39EF),
                                                                  textStyle:
                                                                      GoogleFonts
                                                                          .getFont(
                                                                    'Lexend Deca',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      8,
                                                                ),
                                                                loading:
                                                                    _loadingButton1,
                                                              ),
                                                            ),
                                                            Visibility(
                                                              visible: rowBottomSectionUsersRecord
                                                                      .contestRefs
                                                                      .contains(
                                                                          socialFeedContestRecord
                                                                              .reference) ??
                                                                  true,
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  setState(() =>
                                                                      _loadingButton2 =
                                                                          true);
                                                                  try {
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                ContestUploads2Widget(
                                                                          contestid:
                                                                              socialFeedContestRecord.reference,
                                                                          costestname:
                                                                              socialFeedContestRecord.subject,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  } finally {
                                                                    setState(() =>
                                                                        _loadingButton2 =
                                                                            false);
                                                                  }
                                                                },
                                                                text:
                                                                    'Katıldın',
                                                                icon: Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 15,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 120,
                                                                  height: 40,
                                                                  color: Color(
                                                                      0xFF208E83),
                                                                  textStyle:
                                                                      GoogleFonts
                                                                          .getFont(
                                                                    'Lexend Deca',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      8,
                                                                ),
                                                                loading:
                                                                    _loadingButton2,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Visibility(
                                                                    visible:
                                                                        socialFeedContestRecord.awardShow ??
                                                                            true,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          'Ödül: ${socialFeedContestRecord.award}',
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme
                                                                            .title3
                                                                            .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Bitiş: ${dateTimeFormat('d/M/y', socialFeedContestRecord.endDate)}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: Color(
                                                                          0xB4000000),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 32),
                        child: StreamBuilder<List<PostsRecord>>(
                          stream: queryPostsRecord(
                            queryBuilder: (postsRecord) => postsRecord
                                .where('winner', isEqualTo: true)
                                .orderBy('winner_contest_end_date',
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
                            List<PostsRecord> socialFeedPostsRecordList =
                                snapshot.data;
                            if (socialFeedPostsRecordList.isEmpty) {
                              return Center(
                                child: Image.asset(
                                  'assets/images/beyaz.png',
                                  width: 0,
                                  height: 0,
                                ),
                              );
                            }
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                    socialFeedPostsRecordList.length,
                                    (socialFeedIndex) {
                                  final socialFeedPostsRecord =
                                      socialFeedPostsRecordList[
                                          socialFeedIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 16),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 250,
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return FullViewWidget(
                                                          image:
                                                              socialFeedPostsRecord
                                                                  .photoUrl,
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Image.network(
                                                    socialFeedPostsRecord
                                                        .photoUrl,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 250,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 16, 16, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          socialFeedPostsRecord
                                                              .winnerContestName,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .title1
                                                                  .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .chevron_right_rounded,
                                                        color: Colors.black,
                                                        size: 24,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -10.14, -0.58),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 4, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'By Shootpoints',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText2
                                                                    .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color: Color(
                                                                  0xFF4B39EF),
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
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0.9),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    16, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x6E6B6B6B),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          OtherProfilWidget(
                                                                    userref:
                                                                        socialFeedPostsRecord
                                                                            .user,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 40,
                                                                    height: 40,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        socialFeedPostsRecord
                                                                            .userProfilePic,
                                                                        'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .fitHeight,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        socialFeedPostsRecord
                                                                            .username,
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        '${dateTimeFormat('d/M/y', socialFeedPostsRecord.winnerContestEndDate)} tarihli yarışmanın kazananı',
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
