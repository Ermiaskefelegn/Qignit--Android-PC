import 'package:flutter/material.dart';
import 'package:qignit_music_player/Store_pages/single_component.dart';
import 'package:qignit_music_player/Store_pages/store_components/Catagories.dart';
import 'package:qignit_music_player/Store_pages/store_components/album_tile.dart';
import 'package:qignit_music_player/Store_pages/store_components/carosel.dart';
import 'package:qignit_music_player/Store_pages/store_components/new_realease.dart';
import 'package:qignit_music_player/appbar2.dart';
import 'package:qignit_music_player/utils/FadePageRoute.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppbar2(
        pagetitle: "Kignit Store",
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ImageCarousel()),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Divider(
                    thickness: 1.5,
                    height: 30.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      "New Released",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, FadePageRoute(widget: NewReleasedList()));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(color: Colors.red),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.width / 1.6,
                  margin: EdgeInsets.only(bottom: 20),
                  child: PageView(
                    controller: PageController(
                      viewportFraction: 0.95,
                    ),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        // color: Colors.black12,
                        child: Column(
                          children: [Albumtile(), Albumtile(), Albumtile()],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        // color: Colors.black12,
                        child: Column(
                          children: [Albumtile(), Albumtile(), Albumtile()],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        // color: Colors.deepPurple[300],
                        child: Column(
                          children: [Albumtile(), Albumtile(), Albumtile()],
                        ),
                      )
                    ],
                  )),
              Container(
                  height: MediaQuery.of(context).size.width / 3,
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: PageView(
                    controller: PageController(
                      viewportFraction: 0.9,
                    ),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              FadePageRoute(widget: Singlecomponent()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.blue,
                          ),
                          height: MediaQuery.of(context).size.width / 2,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white54,
                        ),
                        height: MediaQuery.of(context).size.width / 2,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.deepPurple[300]),
                        height: MediaQuery.of(context).size.width / 2,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      ),
                    ],
                  )),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Divider(
                    thickness: 1.5,
                    height: 30.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      "Catagories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, FadePageRoute(widget: Catagories()));
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(color: Colors.red),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.width / 1.6,
                  margin: EdgeInsets.only(bottom: 20),
                  child: PageView(
                    controller: PageController(
                      viewportFraction: 0.95,
                    ),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [Albumtile(), Albumtile(), Albumtile()],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        // color: Colors.white54,
                        child: Column(
                          children: [Albumtile(), Albumtile(), Albumtile()],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        // color: Colors.deepPurple[300],
                        child: Column(
                          children: [Albumtile(), Albumtile(), Albumtile()],
                        ),
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
