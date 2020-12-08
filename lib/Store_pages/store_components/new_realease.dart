import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qignit_music_player/Store_pages/store_components/album_tile_for_api.dart';
import 'package:qignit_music_player/appbar3.dart';

class NewReleasedList extends StatefulWidget {
  @override
  _NewReleasedListState createState() => _NewReleasedListState();
}

class _NewReleasedListState extends State<NewReleasedList> {
  List fetcheddata = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    this.fetchdata();
  }

  fetchdata() async {
    var url = "http://10.0.2.2:8000/api/albums";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print("i found this data " + items.toString());
      setState(() {
        fetcheddata = items;
      });
    } else {
      setState(() {
        fetcheddata = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbar3(
            pagetitle: "Newly Realeased",
            onpressed: () {
              Navigator.pop(context);
            }),
        body: fetcheddata.contains(null) || fetcheddata.length < 0
            ? Center(
                child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)))
            : ListView.builder(
                itemCount: fetcheddata.length,
                itemBuilder: (BuildContext context, int inIndex) {
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Albumtileapi(
                        album_title:
                            fetcheddata[inIndex]['album_name'].toString(),
                        artist_name:
                            fetcheddata[inIndex]['album_artist'].toString(),
                      ));
                }));
  }
}
