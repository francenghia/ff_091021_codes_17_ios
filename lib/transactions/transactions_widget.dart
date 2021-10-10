import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionsWidget extends StatefulWidget {
  TransactionsWidget({Key key}) : super(key: key);

  @override
  _TransactionsWidgetState createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<TransactionsWidget> {
  TextEditingController textController1;
  bool _loadingButton1 = false;
  TextEditingController textController2;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) =>
              usersRecord.where('email', isEqualTo: currentUserEmail),
          singleRecord: true,
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
          List<UsersRecord> transactionsUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final transactionsUsersRecord = transactionsUsersRecordList.isNotEmpty
              ? transactionsUsersRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NavBarPage(initialPage: 'ana_sayfa'),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              title: Text(
                'Hesap Durumu',
                style: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF151B1E),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0,
            ),
            backgroundColor: Color(0xFFF1F4F8),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.98,
                                        height: 180,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF3D2DC5),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFF4B39EF),
                                          elevation: 6,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.84, -0.9),
                                                child: Text(
                                                  'Bakiye',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                    fontSize: 32,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.86, -0.41),
                                                child: AutoSizeText(
                                                  valueOrDefault<String>(
                                                    '${valueOrDefault<String>(
                                                      transactionsUsersRecord
                                                          .totalTl
                                                          .toString(),
                                                      '0',
                                                    )} TL',
                                                    '0 TL',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.95, 0.86),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Image.asset(
                                                    'assets/images/tl_logo.png',
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.82, 0.83),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      transactionsUsersRecord
                                                          .username,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      transactionsUsersRecord
                                                          .email,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0x7EFFFFFF),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 20, 0, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Ödeme Talep Edilen Tutar',
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/tl_logo.png',
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(
                                              -0.86, -0.41),
                                          child: AutoSizeText(
                                            valueOrDefault<String>(
                                              '${valueOrDefault<String>(
                                                transactionsUsersRecord.totalTl
                                                    .toString(),
                                                '0',
                                              )} TL',
                                              '0 TL',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord
                                                  .where('email',
                                                      isEqualTo:
                                                          currentUserEmail)
                                                  .where('total_tl',
                                                      isGreaterThan: 100),
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
                                          List<UsersRecord> rowUsersRecordList =
                                              snapshot.data;
                                          if (rowUsersRecordList.isEmpty) {
                                            return Image.asset(
                                              'assets/images/beyaz.png',
                                              width: 0,
                                              height: 0,
                                            );
                                          }
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                rowUsersRecordList.length,
                                                (rowIndex) {
                                              final rowUsersRecord =
                                                  rowUsersRecordList[rowIndex];
                                              return Visibility(
                                                visible: transactionsUsersRecord
                                                        .iBANOk ??
                                                    true,
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    setState(() =>
                                                        _loadingButton1 = true);
                                                    try {
                                                      final paymentsCreateData =
                                                          createPaymentsRecordData(
                                                        user:
                                                            transactionsUsersRecord
                                                                .reference,
                                                        takeAmount:
                                                            transactionsUsersRecord
                                                                .totalTl,
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        status: 'Talep',
                                                        updateTime:
                                                            getCurrentTimestamp,
                                                        userEmail:
                                                            transactionsUsersRecord
                                                                .email,
                                                        userName:
                                                            transactionsUsersRecord
                                                                .username,
                                                      );
                                                      await PaymentsRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              paymentsCreateData);

                                                      final usersUpdateData =
                                                          createUsersRecordData(
                                                        totalTl: 0,
                                                      );
                                                      await transactionsUsersRecord
                                                          .reference
                                                          .update(
                                                              usersUpdateData);
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Ödeme emriniz başarıyla alındı.'),
                                                            content: Text(
                                                                'Paylaştığınız IBAN no ve alıcı Ad & Soyad bilgilerinin doğru olması halinde ödemeniz en geç 15 iş günü içerisinde iletilecektir. '),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text(' '),
                                                              ),
                                                              TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      alertDialogContext);
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          NavBarPage(
                                                                              initialPage: 'ana_sayfa'),
                                                                    ),
                                                                  );
                                                                  ;
                                                                },
                                                                child: Text(
                                                                    'Tamam '),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );

                                                      setState(() {});
                                                    } finally {
                                                      setState(() =>
                                                          _loadingButton1 =
                                                              false);
                                                    }
                                                  },
                                                  text: 'Talep Et',
                                                  options: FFButtonOptions(
                                                    width: 100,
                                                    height: 40,
                                                    color: Color(0xFF4391FC),
                                                    textStyle: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 4,
                                                  ),
                                                  loading: _loadingButton1,
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.96,
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDCE0E4),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 12, 8, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'IBAN NO',
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF8B97A2),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 4, 8, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          onChanged: (_) => setState(() {}),
                                          controller: textController1 ??=
                                              TextEditingController(
                                            text:
                                                transactionsUsersRecord.iBANNo,
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'IBAN NO',
                                            hintStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDCE0E4),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDCE0E4),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            suffixIcon: textController1
                                                    .text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () => setState(
                                                      () => textController1
                                                          .clear(),
                                                    ),
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 12, 8, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Alıcı Ad Soyad',
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF8B97A2),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 4, 8, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          onChanged: (_) => setState(() {}),
                                          controller: textController2 ??=
                                              TextEditingController(
                                            text: transactionsUsersRecord
                                                .aliciAdSoyad,
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Alıcı Ad Soyad',
                                            hintStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDCE0E4),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFDCE0E4),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            suffixIcon: textController2
                                                    .text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () => setState(
                                                      () => textController2
                                                          .clear(),
                                                    ),
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 4, 8, 4),
                                    child: Text(
                                      'Lütfen ödeme talep etmeden önce IBAN Numaranızın ve alıcı Ad & Soyad bilgilerinin doğru olduğundan emin olun. Ödemeler en geç 15 iş günü içerisinde hesabınıza gönderilecektir. Minimum talep edilebilecek tutar 100 TL\' dir.',
                                      textAlign: TextAlign.center,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF7A7A7A),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0.05),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 50, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => _loadingButton2 = true);
                                        try {
                                          final usersUpdateData =
                                              createUsersRecordData(
                                            iBANNo: textController1?.text ?? '',
                                            aliciAdSoyad:
                                                textController2?.text ?? '',
                                            iBANOk: true,
                                          );
                                          await transactionsUsersRecord
                                              .reference
                                              .update(usersUpdateData);
                                        } finally {
                                          setState(
                                              () => _loadingButton2 = false);
                                        }
                                      },
                                      text: 'Bilgilerimi Güncelle',
                                      options: FFButtonOptions(
                                        width: 340,
                                        height: 60,
                                        color: Color(0xFF4C3AF3),
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
