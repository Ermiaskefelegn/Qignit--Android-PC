import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:qignit_music_player/pages/now_playing.dart';
import 'package:qignit_music_player/widgets/mp_inherited.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    Song s;
    // bool nowPlayTap = false;
    final rootIW = MPInheritedWidget.of(context);
    return Scaffold(
      body: NowPlaying(rootIW.songData, s),
    );
  }
}
