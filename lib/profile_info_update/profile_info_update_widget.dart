import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfoUpdateWidget extends StatefulWidget {
  ProfileInfoUpdateWidget({Key key}) : super(key: key);

  @override
  _ProfileInfoUpdateWidgetState createState() =>
      _ProfileInfoUpdateWidgetState();
}

class _ProfileInfoUpdateWidgetState extends State<ProfileInfoUpdateWidget> {
  String uploadedFileUrl = '';
  bool _loadingButton1 = false;
  TextEditingController textController;
  bool _loadingButton2 = false;
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
        final profileInfoUpdateUsersRecord = snapshot.data;
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
              'Profil Bilgileri',
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            padding: EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
                            child: Container(
                              width: 100,
                              height: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  profileInfoUpdateUsersRecord.profilePicUrl,
                                  'https://res.cloudinary.com/meeelingo/image/upload/v1630351199/iconlar/icons8-male-user-100_2.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton1 = true);
                            try {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  validateFileFormat(
                                      selectedMedia.storagePath, context)) {
                                showUploadMessage(context, 'Uploading file...',
                                    showLoading: true);
                                final downloadUrl = await uploadData(
                                    selectedMedia.storagePath,
                                    selectedMedia.bytes);
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                if (downloadUrl != null) {
                                  setState(() => uploadedFileUrl = downloadUrl);
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  showUploadMessage(
                                      context, 'Failed to upload media');
                                  return;
                                }
                              }

                              final usersUpdateData = createUsersRecordData(
                                profilePicUrl: uploadedFileUrl,
                                photoUrl: uploadedFileUrl,
                              );
                              await profileInfoUpdateUsersRecord.reference
                                  .update(usersUpdateData);
                            } finally {
                              setState(() => _loadingButton1 = false);
                            }
                          },
                          text: 'Resmi Değiştir',
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: Color(0x00FFFFFF),
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: 0,
                          ),
                          loading: _loadingButton1,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                      child: TextFormField(
                        controller: textController ??= TextEditingController(
                          text: profileInfoUpdateUsersRecord.username,
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Ad Soyad',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF95A1AC),
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
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF14181B),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.96,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                          child: AutoSizeText(
                            profileInfoUpdateUsersRecord.email,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.05),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton2 = true);
                          try {
                            final usersUpdateData = createUsersRecordData(
                              profilePicUrl: uploadedFileUrl,
                              username: textController?.text ?? '',
                              displayName: textController?.text ?? '',
                              photoUrl: uploadedFileUrl,
                            );
                            await profileInfoUpdateUsersRecord.reference
                                .update(usersUpdateData);
                            Navigator.pop(context);
                          } finally {
                            setState(() => _loadingButton2 = false);
                          }
                        },
                        text: 'Güncelle',
                        options: FFButtonOptions(
                          width: 340,
                          height: 60,
                          color: Color(0xFF4B39EF),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                        loading: _loadingButton2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
