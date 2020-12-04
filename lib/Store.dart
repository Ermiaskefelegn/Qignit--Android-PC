import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qignit_music_player/Store_pages/Account.dart';
import 'package:qignit_music_player/Store_pages/Home.dart';
import 'package:qignit_music_player/Store_pages/More.dart';
import 'package:qignit_music_player/Store_pages/Search.dart';
import 'package:qignit_music_player/theme_changer.dart';

class Store extends StatefulWidget {
  Store({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage;
  bool lightison = true;

  @override
  void initState() {
    super.initState();
    _listPages..add(Home())..add(Search())..add(Account())..add(More());
    _currentPage = Home();
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
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 17),
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
                  Icons.home,
                ),
                title: Text(
                  "Home",
                )),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.search), title: Text("Search")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("Account")),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), title: Text("More")),
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
}
