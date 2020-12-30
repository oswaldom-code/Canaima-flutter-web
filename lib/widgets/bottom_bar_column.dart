import 'package:flutter/material.dart';

class BottomBarColumn extends StatefulWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;
  final String url1;
  final String url2;
  final String url3;

//falta asignar las URL y _isHovering
  BottomBarColumn(
      {this.heading,
      this.s1,
      this.s2,
      this.s3,
      this.url1,
      this.url2,
      this.url3});

  @override
  _BottomBarColumnState createState() => _BottomBarColumnState();
}

class _BottomBarColumnState extends State<BottomBarColumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.heading,
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                //_isHovering[0] = _setStateHelper(_isHovering);
                //_isHovering[0] = _isHovering[0] ? false : true;
              });
            },
            onTap: () {},
            child: Text(
              widget.s1,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            widget.s2,
            style: TextStyle(
              color: Colors.blueGrey[100],
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5),
          Text(
            widget.s3,
            style: TextStyle(
              color: Colors.blueGrey[100],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
