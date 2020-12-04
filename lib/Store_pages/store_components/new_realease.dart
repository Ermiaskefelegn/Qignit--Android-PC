import 'package:flutter/material.dart';

import 'package:qignit_music_player/Store_pages/store_components/album_tile.dart';
import 'package:qignit_music_player/appbar3.dart';

class NewReleasedList extends StatefulWidget {
  @override
  _NewReleasedListState createState() => _NewReleasedListState();
}

class _NewReleasedListState extends State<NewReleasedList> {
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbar3(
            pagetitle: "Newly Realeased",
            onpressed: () {
              Navigator.pop(context);
            }),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int inIndex) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Albumtile());
            }));
  }
}
