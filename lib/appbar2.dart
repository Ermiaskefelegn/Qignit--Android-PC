import 'package:flutter/material.dart';
import 'package:qignit_music_player/main.dart';
import 'package:qignit_music_player/utils/FadePageRoute.dart';

class CustomeAppbar2 extends StatelessWidget with PreferredSizeWidget {
  final Function onpressed;
  final String pagetitle;
  CustomeAppbar2({Key key, this.onpressed, this.pagetitle}) : super(key: key);
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
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                pagetitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, FadePageRoute(widget: MyApp()));
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.music_note, color: Colors.red),
                        Text('Music', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
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
