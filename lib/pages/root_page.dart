import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:qignit_music_player/pages/now_playing.dart';
import 'package:qignit_music_player/widgets/mp_inherited.dart';
import 'package:qignit_music_player/widgets/mp_lisview.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootIW = MPInheritedWidget.of(context);
    //Goto Now Playing Page
    void goToNowPlaying(Song s, {bool nowPlayTap: false}) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new NowPlaying(
                    rootIW.songData,
                    s,
                    nowPlayTap: nowPlayTap,
                  )));
    }

    //Shuffle Songs and goto now playing page
    void shuffleSongs() {
      goToNowPlaying(rootIW.songData.randomSong);
    }

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        leading: new Container(
          padding: const EdgeInsets.all(0.0),
          child: new Center(
            child: IconButton(
                icon: Icon(
                  Icons.play_circle_filled,
                ),
                onPressed: () => goToNowPlaying(
                      rootIW.songData.songs[
                          (rootIW.songData.currentIndex == null ||
                                  rootIW.songData.currentIndex < 0)
                              ? 0
                              : rootIW.songData.currentIndex],
                      nowPlayTap: true,
                    )),
          ),
        ),
        backgroundColor: Colors.black.withOpacity(0.5),
        title: new Text("Playlist"),
      ),
      // drawer: new MPDrawer(),
      body: rootIW.isLoading
          ? new Center(child: new CircularProgressIndicator())
          : new Scrollbar(child: new MPListView()),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.shuffle), onPressed: () => shuffleSongs()),
    );
  }
}
