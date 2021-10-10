import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyUploadsWidget extends StatefulWidget {
  MyUploadsWidget({
    Key key,
    this.contestuid,
  }) : super(key: key);

  final DocumentReference contestuid;

  @override
  _MyUploadsWidgetState createState() => _MyUploadsWidgetState();
}

class _MyUploadsWidgetState extends State<MyUploadsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ContestRecord>(
      stream: ContestRecord.getDocument(widget.contestuid),
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
        final myUploadsContestRecord = snapshot.data;
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
            title: Text(
              'Paylaşımlarım',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 16),
              child: StreamBuilder<List<PostsRecord>>(
                stream: queryPostsRecord(
                  queryBuilder: (postsRecord) => postsRecord
                      .where('user', isEqualTo: currentUserReference)
                      .where('foto_show', isEqualTo: true)
                      .where('deleted', isEqualTo: false)
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
                  List<PostsRecord> gridViewPostsRecordList = snapshot.data;
                  if (gridViewPostsRecordList.isEmpty) {
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: gridViewPostsRecordList.length,
                    itemBuilder: (context, gridViewIndex) {
                      final gridViewPostsRecord =
                          gridViewPostsRecordList[gridViewIndex];
                      return InkWell(
                        onTap: () async {
                          final postsUpdateData = {
                            'attendant_contest':
                                FieldValue.arrayUnion([widget.contestuid]),
                          };
                          await gridViewPostsRecord.reference
                              .update(postsUpdateData);

                          final contestUpdateData = {
                            'num_of_contestant': FieldValue.increment(1),
                            'attendies': FieldValue.arrayUnion(
                                [gridViewPostsRecord.reference]),
                            'attendies_users':
                                FieldValue.arrayUnion([currentUserReference]),
                          };
                          await myUploadsContestRecord.reference
                              .update(contestUpdateData);

                          final usersUpdateData = {
                            'contest_refs':
                                FieldValue.arrayUnion([widget.contestuid]),
                          };
                          await currentUserReference.update(usersUpdateData);
                          Navigator.pop(context);
                        },
                        child: CachedNetworkImage(
                          imageUrl: gridViewPostsRecord.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
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
