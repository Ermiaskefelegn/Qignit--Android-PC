import 'package:flutter/material.dart';
import 'package:qignit_music_player/Store.dart';
import 'package:qignit_music_player/utils/FadePageRoute.dart';

class CustomeAppbar extends StatelessWidget with PreferredSizeWidget {
  final Function onpressed;
  final String pagetitle;
  CustomeAppbar({Key key, this.onpressed, this.pagetitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      //color: Colors.redAccent,
      height: 80,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, FadePageRoute(widget: Store()));
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.shopping_cart, color: Colors.red),
                    Text('Store', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4.6,
              ),
              Text(
                pagetitle,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20.0,
                ),
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
