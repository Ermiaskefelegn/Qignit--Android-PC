import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qignit_music_player/Store_pages/Account.dart';
import 'package:qignit_music_player/appbar3.dart';
import 'package:qignit_music_player/utils/FadePageRoute.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Downloads.dart';

class Singlecomponent extends StatefulWidget {
  @override
  _SinglecomponentState createState() => _SinglecomponentState();
}

class _SinglecomponentState extends State<Singlecomponent> {
  bool buttonispressed = true;
  bool startdownload = false;
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  void purchase() {
    print(isAuth);
    if (isAuth) {
      Navigator.push(context, FadePageRoute(widget: Downloads()));
    } else {
      Navigator.push(context, FadePageRoute(widget: Account()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppbar3(
          pagetitle: "Music",
          onpressed: () {
            Navigator.pop(context);
          }),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  buttonispressed = true;
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Image.asset("assets/home_2.jpg"),
                        margin: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 4),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Album Title",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Album Artist",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Album Genre",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Number of Songs",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Album Release Date",
                            style: TextStyle(fontSize: 14),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: buttonispressed
                                  ? RaisedButton(
                                      color: Colors.blue,
                                      child: Text("100 Birr ETB"),
                                      onPressed: () => {
                                        setState(() {
                                          purchase();
                                          buttonispressed = !buttonispressed;
                                          startdownload = false;
                                          print(
                                              "the value of the button is $buttonispressed");
                                        })
                                      },
                                    )
                                  : RaisedButton(
                                      color: startdownload
                                          ? Colors.white
                                          : Colors.green,
                                      child: startdownload
                                          ? Text("Downloading ")
                                          : Text("Buy Album   "),
                                      onPressed: () async {
                                        setState(() {
                                          startdownload = true;
                                          print(
                                              "the value of the button is $buttonispressed");
                                        });
                                        final status =
                                            await Permission.storage.request();
                                        if (status.isGranted) {
                                          final externalDir =
                                              await getExternalStorageDirectory();
                                          final id =
                                              await FlutterDownloader.enqueue(
                                            url: null,
                                            savedDir: externalDir.path,
                                            fileName: "Qignit Album",
                                            showNotification: true,
                                            openFileFromNotification: true,
                                          );
                                        } else {
                                          print('permission denied');
                                        }
                                      },
                                    ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 500,
              child: PageView(
                controller: PageController(
                  viewportFraction: 1,
                ),
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          "Song List",
                          style: TextStyle(fontSize: 20),
                        )),
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue[50],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.blue,
                        ),
                        height: MediaQuery.of(context).size.height / 1.6,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          "Reviews",
                          style: TextStyle(fontSize: 20),
                        )),
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue[100],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.blue,
                        ),
                        height: MediaQuery.of(context).size.height / 1.6,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          "Related Albums",
                          style: TextStyle(fontSize: 20),
                        )),
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.blue[200],
                        ),
                        height: MediaQuery.of(context).size.height / 1.6,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
