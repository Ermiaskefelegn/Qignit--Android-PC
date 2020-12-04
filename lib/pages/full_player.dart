import 'package:flutter/material.dart';
import 'package:qignit_music_player/pages/lyrics.dart';

class FullPlayer extends StatefulWidget {
  @override
  _FullPlayerState createState() => _FullPlayerState();
}

class _FullPlayerState extends State<FullPlayer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text("More"),
                bottom: TabBar(tabs: [
                  Tab(icon: Icon(Icons.file_download)),
                  Tab(icon: Icon(Icons.event_busy)),
                ])),
            body: TabBarView(children: [
              Center(child: Lyrics()),
            ])));
  }
}
