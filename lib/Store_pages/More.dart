import 'package:flutter/material.dart';
import 'package:qignit_music_player/Store_pages/Downloads.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
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
            Center(child: Downloads()),
            Center(child: Text("Birthdays")),
          ])),
    );
  }
}
