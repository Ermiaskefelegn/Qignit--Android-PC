import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qignit_music_player/Store_pages/store_components/album_tile.dart';
import 'package:qignit_music_player/appbar3.dart';

class NewReleasedList extends StatefulWidget {
  @override
  _NewReleasedListState createState() => _NewReleasedListState();
}

class _NewReleasedListState extends State<NewReleasedList> {
  List<dynamic> fetcheddata = [];
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
      Map<String, dynamic> items = json.decode(response.body);
      setState(() {
        fetcheddata = items['datakey'];
      });
      print(items);
    } else {
      setState(() {
        fetcheddata = [];
      });
    }
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbar3(
            pagetitle: "Newly Realeased",
            onpressed: () {
              Navigator.pop(context);
            }),
        body: ListView.builder(
            itemCount: fetcheddata.length,
            itemBuilder: (BuildContext context, int inIndex) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Albumtile());
            }));
  }
}
