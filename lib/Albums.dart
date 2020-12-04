import 'package:flutter/material.dart';

import 'package:qignit_music_player/appbar.dart';

class Albums extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbar(
          pagetitle: "Albums",
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.amber.withOpacity(0.5),
                    height: 80,
                    width: 80,
                    child: Image.asset("assets/IMG_3849.JPG"),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Et1hiopia",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Teddy Afro",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    height: 80,
                    width: 80,
                    child: Image.asset("assets/IMG_3848.JPG"),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Nafkot & Fikir",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Mikael Belayneh",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
