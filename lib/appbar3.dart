import 'package:flutter/material.dart';

class CustomeAppbar3 extends StatelessWidget with PreferredSizeWidget {
  final Function onpressed;
  final String pagetitle;
  CustomeAppbar3({Key key, this.onpressed, this.pagetitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      //color: Colors.redAccent,
      height: 80,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: onpressed,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                pagetitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4.5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
