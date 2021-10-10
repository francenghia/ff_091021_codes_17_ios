import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsListWidget extends StatefulWidget {
  CommentsListWidget({
    Key key,
    this.postid,
  }) : super(key: key);

  final DocumentReference postid;

  @override
  _CommentsListWidgetState createState() => _CommentsListWidgetState();
}

class _CommentsListWidgetState extends State<CommentsListWidget> {
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBar(
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
                title: Text(
                  'Yorumlar',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF14181B),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 2),
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
                    final rowPostsRecord = snapshot.data;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: TextFormField(
                              onChanged: (_) => setState(() {}),
                              controller: textController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Mesajınızı yazın...',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 12,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                suffixIcon: textController.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => textController.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF8B97A2),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: InkWell(
                            onTap: () async {
                              final commentsCreateData =
                                  createCommentsRecordData(
                                user: columnUsersRecord.reference,
                                comment: textController.text,
                                createdTime: getCurrentTimestamp,
                                userPhoto: columnUsersRecord.profilePicUrl,
                                username: columnUsersRecord.username,
                                postid: widget.postid,
                              );
                              await CommentsRecord.collection
                                  .doc()
                                  .set(commentsCreateData);

                              final postsUpdateData = {
                                ...createPostsRecordData(
                                  lastComment: textController.text,
                                  lastCommentUserPhoto:
                                      columnUsersRecord.profilePicUrl,
                                  lastCommentUsername:
                                      columnUsersRecord.username,
                                  lastCommentDate: getCurrentTimestamp,
                                ),
                                'num_of_comments': FieldValue.increment(1),
                              };
                              await rowPostsRecord.reference
                                  .update(postsUpdateData);
                            },
                            child: Icon(
                              Icons.done_outline_sharp,
                              color: Color(0xFF5B5B5B),
                              size: 42,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<CommentsRecord>>(
                        stream: queryCommentsRecord(
                          queryBuilder: (commentsRecord) => commentsRecord
                              .where('postid', isEqualTo: widget.postid)
                              .orderBy('created_time', descending: true),
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
                          List<CommentsRecord> columnCommentsRecordList =
                              snapshot.data;
                          if (columnCommentsRecordList.isEmpty) {
                            return Center(
                              child: Image.asset(
                                'assets/images/beyaz.png',
                                width: 0,
                                height: 0,
                              ),
                            );
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(
                                columnCommentsRecordList.length, (columnIndex) {
                              final columnCommentsRecord =
                                  columnCommentsRecordList[columnIndex];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 10, 4, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            columnCommentsRecord.userPhoto,
                                            'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                          ),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 0, 2, 0),
                                            child: Text(
                                              '${columnCommentsRecord.username} ${dateTimeFormat('d/M/y', columnCommentsRecord.createdTime)} ${dateTimeFormat('Hm', columnCommentsRecord.createdTime)}',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 1, 2, 0),
                                            child: AutoSizeText(
                                              columnCommentsRecord.comment,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        ],
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
              )
            ],
          );
        },
      ),
    );
  }
}
