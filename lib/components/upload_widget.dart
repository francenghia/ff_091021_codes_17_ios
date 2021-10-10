import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../photo_upload/photo_upload_widget.dart';
import '../video_upload/video_upload_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadWidget extends StatefulWidget {
  UploadWidget({Key key}) : super(key: key);

  @override
  _UploadWidgetState createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  bool _loadingButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () async {
                    final usersUpdateData = createUsersRecordData(
                      videoUploadLoading: false,
                      videoLink: ' ',
                    );
                    await currentUserReference.update(usersUpdateData);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoUploadWidget(),
                      ),
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Vidyo Yükle',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF595959),
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(4, 0, 10, 0),
                            child: Icon(
                              Icons.videocam_outlined,
                              color: Color(0xFF4C3AF3),
                              size: 32,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 4,
                  endIndent: 4,
                  color: Color(0xFF9A9A9A),
                ),
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoUploadWidget(),
                      ),
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Fotoğraf Yükle',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF595959),
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(4, 0, 10, 0),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Color(0xFF4C3AF3),
                              size: 32,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 10, 4, 25),
            child: FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton = true);
                try {
                  Navigator.pop(context);
                } finally {
                  setState(() => _loadingButton = false);
                }
              },
              text: 'İptal',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: Color(0xFF4C3AF3),
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 4,
              ),
              loading: _loadingButton,
            ),
          )
        ],
      ),
    );
  }
}
