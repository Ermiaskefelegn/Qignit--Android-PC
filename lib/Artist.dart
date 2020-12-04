import 'package:flutter/material.dart';
import 'package:qignit_music_player/appbar.dart';

class Artists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbar(
          pagetitle: "Artists",
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.music_note,
                      size: 80,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Aster Aweke",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "15 tracks",
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
                            "Teddy Afro",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "14 tracks",
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
                            "Mikael Belayneh",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "12 tracks",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
