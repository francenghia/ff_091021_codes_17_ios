import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerAggrementWidget extends StatefulWidget {
  CustomerAggrementWidget({Key key}) : super(key: key);

  @override
  _CustomerAggrementWidgetState createState() =>
      _CustomerAggrementWidgetState();
}

class _CustomerAggrementWidgetState extends State<CustomerAggrementWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          'Kullanıcı Sözleşmesi',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF14181B),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Shootpoints',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Swanky and Moo Moo',
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Expanded(
                child: StreamBuilder<List<YasalRecord>>(
                  stream: queryYasalRecord(
                    queryBuilder: (yasalRecord) =>
                        yasalRecord.where('no', isEqualTo: 2),
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
                    List<YasalRecord> columnYasalRecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final columnYasalRecord = columnYasalRecordList.isNotEmpty
                        ? columnYasalRecordList.first
                        : null;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AutoSizeText(
                            columnYasalRecord.metin,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
