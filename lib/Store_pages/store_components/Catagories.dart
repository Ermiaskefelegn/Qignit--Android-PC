import 'package:flutter/material.dart';
import 'package:qignit_music_player/Store_pages/store_components/album_tile.dart';

import 'package:qignit_music_player/appbar3.dart';

class Catagories extends StatefulWidget {
  @override
  _CatagoriesState createState() => _CatagoriesState();
}

class _CatagoriesState extends State<Catagories> {
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbar3(
            pagetitle: "Catagories",
            onpressed: () {
              Navigator.pop(context);
            }),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: PageView(
              controller: PageController(
                viewportFraction: 0.95,
              ),
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Ambasel"),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int inIndex) {
                                return Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Albumtile());
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Text("AnchiHoye"),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int inIndex) {
                                return Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Albumtile());
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Text("Bati"),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int inIndex) {
                                return Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Albumtile());
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Text("Tizita"),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int inIndex) {
                                return Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Albumtile());
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
