import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullViewWidget extends StatefulWidget {
  FullViewWidget({
    Key key,
    this.image,
  }) : super(key: key);

  final String image;

  @override
  _FullViewWidgetState createState() => _FullViewWidgetState();
}

class _FullViewWidgetState extends State<FullViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Image.network(
              widget.image,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.97, -0.97),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
              child: InkWell(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/icons8-cancel-96.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
