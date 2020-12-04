import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:qignit_music_player/Albums.dart';
import 'package:qignit_music_player/Genere.dart';
import 'package:qignit_music_player/my_app.dart';
import 'package:qignit_music_player/theme_changer.dart';
import 'Artist.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.light,
      builder: (context, _brightness) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // primarySwatch: Colors.blue,
              brightness: _brightness,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MyHomePage());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel("Cypher_channel");

  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage;
  bool lightison = true;

  //FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _listPages
      ..add(LandingPage())
      ..add(Artists())
      ..add(Genere())
      ..add(Albums())
      ..add(LandingPage());
    _currentPage = Albums();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: _currentPage,
          ),
          Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 1.15,
                  top: MediaQuery.of(context).size.height / 16),
              child: lightison
                  ? IconButton(
                      icon: Icon(Icons.brightness_5),
                      onPressed: () {
                        setState(() {
                          _incrementCounter();
                          lightison = false;
                        });
                      })
                  : IconButton(
                      icon: Icon(Icons.brightness_6),
                      onPressed: () {
                        setState(() {
                          _incrementCounter();
                          lightison = true;
                        });
                      }))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.playlist_play,
                  size: 30,
                ),
                title: Text(
                  "Playlists",
                )),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.music), title: Text("Artists")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.layerGroup), title: Text("Genere")),
            BottomNavigationBarItem(
                icon: Icon(Icons.album), title: Text("Albums")),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline), title: Text("Player")),
          ],
          unselectedItemColor: Colors.grey[500],
          showUnselectedLabels: true,
          fixedColor: Colors.redAccent,
          onTap: (selectedIndex) {
            setState(() {
              _changePage(selectedIndex);
            });
          }),
    );
  }

  void _incrementCounter() {
    ThemeBuilder.of(context).ChangeTheme();
  }

  void Printy() async {
    String value;
    try {
      value = await platform.invokeMethod("Printy");
    } catch (e) {
      print(e);
    }
    print(value);
  }
}
