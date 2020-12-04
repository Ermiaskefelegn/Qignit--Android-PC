import 'package:flutter/material.dart';

class Imageholer extends StatefulWidget {
  final String assetname;

  const Imageholer({Key key, this.assetname}) : super(key: key);
  @override
  _ImageholerState createState() => _ImageholerState();
}

class _ImageholerState extends State<Imageholer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width / 1.2,
      child: Image.asset(widget.assetname),
    );
  }
}
