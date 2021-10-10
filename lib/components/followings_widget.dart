import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../other_profil/other_profil_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowingsWidget extends StatefulWidget {
  FollowingsWidget({Key key}) : super(key: key);

  @override
  _FollowingsWidgetState createState() => _FollowingsWidgetState();
}

class _FollowingsWidgetState extends State<FollowingsWidget> {
  @override
  Widget build(BuildContext context) {
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
            'Takiptekiler',
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
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 32),
            child: StreamBuilder<List<FollowsRecord>>(
              stream: queryFollowsRecord(
                queryBuilder: (followsRecord) => followsRecord
                    .where('follower', isEqualTo: currentUserReference)
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
                List<FollowsRecord> columnFollowsRecordList = snapshot.data;
                if (columnFollowsRecordList.isEmpty) {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(columnFollowsRecordList.length,
                      (columnIndex) {
                    final columnFollowsRecord =
                        columnFollowsRecordList[columnIndex];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 10, 4, 10),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtherProfilWidget(
                                  userref: columnFollowsRecord.following,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OtherProfilWidget(
                                        userref: columnFollowsRecord.following,
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1, 1, 1, 1),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          columnFollowsRecord
                                              .followingProfilePic,
                                          'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 0, 2, 0),
                                      child: Text(
                                        columnFollowsRecord.followingName,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
