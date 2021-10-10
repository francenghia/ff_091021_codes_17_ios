import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoUploadWidget extends StatefulWidget {
  PhotoUploadWidget({Key key}) : super(key: key);

  @override
  _PhotoUploadWidgetState createState() => _PhotoUploadWidgetState();
}

class _PhotoUploadWidgetState extends State<PhotoUploadWidget> {
  String uploadedFileUrl = '';
  TextEditingController textInfoController;
  TextEditingController textTagController;
  var placePickerValue = FFPlace();
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textInfoController = TextEditingController();
    textTagController = TextEditingController();
  }

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
        final photoUploadUsersRecord = snapshot.data;
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.94,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      validateFileFormat(
                                          selectedMedia.storagePath, context)) {
                                    showUploadMessage(
                                        context, 'Uploading file...',
                                        showLoading: true);
                                    final downloadUrl = await uploadData(
                                        selectedMedia.storagePath,
                                        selectedMedia.bytes);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (downloadUrl != null) {
                                      setState(
                                          () => uploadedFileUrl = downloadUrl);
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      showUploadMessage(
                                          context, 'Failed to upload media');
                                      return;
                                    }
                                  }
                                },
                                child: Image.network(
                                  valueOrDefault<String>(
                                    uploadedFileUrl,
                                    'https://res.cloudinary.com/meeelingo/image/upload/v1630929858/iconlar/tenor.jpg',
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: textInfoController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Açıklama ekleyin...',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText2.override(
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
                                                20, 32, 20, 12),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
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
                            Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: TextFormField(
                                  controller: textTagController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Etiket ekleyin...',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText2.override(
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
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 32, 20, 12),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 4,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                  child: FlutterFlowPlacePicker(
                    iOSGoogleMapsApiKey:
                        'AIzaSyDUXPlR-hja3CB5M020Ondy7H7W3mB3peI',
                    androidGoogleMapsApiKey:
                        'AIzaSyDUXPlR-hja3CB5M020Ondy7H7W3mB3peI',
                    webGoogleMapsApiKey:
                        'AIzaSyDUXPlR-hja3CB5M020Ondy7H7W3mB3peI',
                    onSelect: (place) =>
                        setState(() => placePickerValue = place),
                    defaultText: 'Lokasyon ekleyin',
                    icon: Icon(
                      Icons.place,
                      color: Color(0xFF95A1AC),
                      size: 16,
                    ),
                    buttonOptions: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      color: Colors.white,
                      textStyle: FlutterFlowTheme.subtitle2.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 16),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() => _loadingButton = true);
                      try {
                        final postsCreateData = createPostsRecordData(
                          info: textInfoController.text,
                          location: placePickerValue.address,
                          numLikes: 0,
                          user: photoUploadUsersRecord.reference,
                          username: photoUploadUsersRecord.username,
                          userProfilePic: photoUploadUsersRecord.profilePicUrl,
                          email: photoUploadUsersRecord.email,
                          displayName: photoUploadUsersRecord.displayName,
                          photoUrl: uploadedFileUrl,
                          createdTime: getCurrentTimestamp,
                          phoneNumber: photoUploadUsersRecord.phoneNumber,
                          video: '',
                          fotoShow: true,
                          videoShow: false,
                          tag: textTagController.text,
                          deleted: false,
                          ilce: placePickerValue.state,
                          il: placePickerValue.city,
                          ulke: placePickerValue.country,
                          videoLink: '',
                          imageUrl: uploadedFileUrl,
                        );
                        await PostsRecord.collection.doc().set(postsCreateData);

                        final usersUpdateData = {
                          'total_posts': FieldValue.increment(1),
                        };
                        await photoUploadUsersRecord.reference
                            .update(usersUpdateData);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'ana_sayfa'),
                          ),
                          (r) => false,
                        );
                      } finally {
                        setState(() => _loadingButton = false);
                      }
                    },
                    text: 'Paylaş',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60,
                      color: Color(0xFF4B39EF),
                      textStyle: FlutterFlowTheme.subtitle2.override(
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
                    loading: _loadingButton,
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
