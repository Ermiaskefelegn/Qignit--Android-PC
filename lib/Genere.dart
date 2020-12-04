import 'package:flutter/material.dart';

import 'package:qignit_music_player/appbar.dart';

class Genere extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbar(
          pagetitle: "Genere",
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.album,
                      size: 80,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Raggae",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "10 tracks",
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
                    child: Icon(
                      Icons.album,
                      size: 80,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Electronic Music",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Rophnan",
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
                    child: Icon(
                      Icons.album,
                      size: 80,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Other",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "20 Tracks",
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
