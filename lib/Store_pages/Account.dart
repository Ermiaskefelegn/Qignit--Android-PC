import 'package:flutter/material.dart';
import 'package:qignit_music_player/Store_pages/Login_component/Home_Page.dart';
import 'package:qignit_music_player/Store_pages/Login_component/Signup_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = Profilepage();
    } else {
      child = SignUp();
    }
    return Scaffold(
      body: child,
    );
  }
}
