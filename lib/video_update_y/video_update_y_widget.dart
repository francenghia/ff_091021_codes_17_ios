import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../photo_sil/photo_sil_widget.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoUpdateYWidget extends StatefulWidget {
  VideoUpdateYWidget({
    Key key,
    this.postid,
  }) : super(key: key);

  final DocumentReference postid;

  @override
  _VideoUpdateYWidgetState createState() => _VideoUpdateYWidgetState();
}

class _VideoUpdateYWidgetState extends State<VideoUpdateYWidget> {
  TextEditingController textFieldEtiketController;
  bool _loadingButton1 = false;
  TextEditingController textFieldYorumController;
  var placePickerValue = FFPlace();
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostsRecord>(
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
        final videoUpdateYPostsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              'Paylaşım',
              style: FlutterFlowTheme.title2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF090F13),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  buttonSize: 48,
                  icon: Icon(
                    Icons.close_rounded,
                    color: Color(0xFF95A1AC),
                    size: 30,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
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
                final columnPostsRecord = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.94,
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x3A000000),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Color(0xFFDBE2E7),
                                            width: 2,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: FlutterFlowVideoPlayer(
                                            path: videoUpdateYPostsRecord.video,
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
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                setState(() =>
                                                    _loadingButton1 = true);
                                                try {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PhotoSilWidget(
                                                        postid:
                                                            videoUpdateYPostsRecord
                                                                .reference,
                                                      ),
                                                    ),
                                                  );
                                                } finally {
                                                  setState(() =>
                                                      _loadingButton1 = false);
                                                }
                                              },
                                              text: 'SİL',
                                              icon: Icon(
                                                Icons.delete_outline,
                                                color: Color(0xFFFF0000),
                                                size: 18,
                                              ),
                                              options: FFButtonOptions(
                                                width: 100,
                                                height: 30,
                                                color: Color(0xFFEDEDED),
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFFFF0000),
                                                  fontSize: 14,
                                                ),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF0000),
                                                  width: 1,
                                                ),
                                                borderRadius: 2,
                                              ),
                                              loading: _loadingButton1,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            child: TextFormField(
                                              controller:
                                                  textFieldEtiketController ??=
                                                      TextEditingController(
                                                text: columnPostsRecord.tag,
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Etiket ekleyin....',
                                                hintStyle: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF8B97A2),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFDBE2E7),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFDBE2E7),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            20, 20, 20, 12),
                                              ),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 4,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(),
                                        child: TextFormField(
                                          controller:
                                              textFieldYorumController ??=
                                                  TextEditingController(
                                            text: columnPostsRecord.info,
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Yorumlarınız....',
                                            hintStyle: FlutterFlowTheme
                                                .bodyText2
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF8B97A2),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDBE2E7),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDBE2E7),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 12),
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 4,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.96,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Color(0xFFDBE2E7),
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 8, 12, 2),
                                          child: Text(
                                            columnPostsRecord.location,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 2, 0, 0),
                                      child: FlutterFlowPlacePicker(
                                        iOSGoogleMapsApiKey:
                                            'AIzaSyDUXPlR-hja3CB5M020Ondy7H7W3mB3peI',
                                        androidGoogleMapsApiKey:
                                            'AIzaSyDUXPlR-hja3CB5M020Ondy7H7W3mB3peI',
                                        webGoogleMapsApiKey:
                                            'AIzaSyDUXPlR-hja3CB5M020Ondy7H7W3mB3peI',
                                        onSelect: (place) => setState(
                                            () => placePickerValue = place),
                                        defaultText: 'Lokasyon seç',
                                        icon: Icon(
                                          Icons.place,
                                          color: Color(0xFF95A1AC),
                                          size: 16,
                                        ),
                                        buttonOptions: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50,
                                          color: Colors.white,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF95A1AC),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0xFFDBE2E7),
                                            width: 2,
                                          ),
                                          borderRadius: 8,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 16, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(
                                              () => _loadingButton2 = true);
                                          try {
                                            final postsUpdateData =
                                                createPostsRecordData(
                                              tag: textFieldEtiketController
                                                      ?.text ??
                                                  '',
                                              info: textFieldYorumController
                                                      ?.text ??
                                                  '',
                                              location:
                                                  placePickerValue.address,
                                              ulke: placePickerValue.country,
                                              il: placePickerValue.city,
                                              ilce: placePickerValue.state,
                                            );
                                            await columnPostsRecord.reference
                                                .update(postsUpdateData);
                                            Navigator.pop(context);
                                          } finally {
                                            setState(
                                                () => _loadingButton2 = false);
                                          }
                                        },
                                        text: 'Güncelle',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 60,
                                          color: Color(0xFF4B39EF),
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
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
                                          borderRadius: 8,
                                        ),
                                        loading: _loadingButton2,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
