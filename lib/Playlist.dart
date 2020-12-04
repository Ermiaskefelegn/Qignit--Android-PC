import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:qignit_music_player/appbar.dart';

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  var _songs;
  MusicFinder audioPlayer;
  @override
  void initState() {
    super.initState();
    initplayer();
  }

  void initplayer() async {
    audioPlayer = new MusicFinder();
    var songs = await MusicFinder.allSongs();
    songs = new List.from(songs);

    setState(() {
      _songs = songs;
    });
  }

  Future _playLocal(String url) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbar(
          pagetitle: "Playlist",
        ),
        body: _songs == null
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.red.withOpacity(0.6)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Loading", style: TextStyle(color: Colors.red))
                  ],
                ),
              )
            : new ListView.builder(
                itemCount: _songs.length,
                itemBuilder: (context, int index) {
                  return new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.red,
                      child: new Text(_songs[index].title[0]),
                    ),
                    title: new Text(_songs[index].title),
                    onTap: () => _playLocal(_songs[index].uri),
                  );
                })

        // Column(
        //   children: <Widget>[
        //     Container(
        //       margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //       child: Row(
        //         children: <Widget>[
        //           Container(
        //             child: Icon(
        //               Icons.playlist_add,
        //               size: 40,
        //               color: Colors.red,
        //             ),
        //           ),
        //           Container(
        //               margin: EdgeInsets.symmetric(horizontal: 20),
        //               child: Column(
        //                 children: <Widget>[
        //                   Text(
        //                     "Add New Playlist",
        //                     style: TextStyle(fontSize: 20, color: Colors.red),
        //                   ),
        //                 ],
        //               )),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //       child: Row(
        //         children: <Widget>[
        //           Container(
        //             child: Icon(
        //               Icons.album,
        //               size: 80,
        //               color: Colors.red,
        //             ),
        //           ),
        //           Container(
        //               margin: EdgeInsets.symmetric(horizontal: 20),
        //               child: Column(
        //                 children: <Widget>[
        //                   Text(
        //                     "Best Amahric",
        //                     style: TextStyle(fontSize: 20),
        //                   ),
        //                   Text(
        //                     "155 musics",
        //                     style: TextStyle(fontSize: 16),
        //                   )
        //                 ],
        //               )),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //       child: Row(
        //         children: <Widget>[
        //           Container(
        //             child: Icon(
        //               Icons.album,
        //               size: 80,
        //               color: Colors.red,
        //             ),
        //           ),
        //           Container(
        //               margin: EdgeInsets.symmetric(horizontal: 20),
        //               child: Column(
        //                 children: <Widget>[
        //                   Text(
        //                     "My Favorite Top 100",
        //                     style: TextStyle(fontSize: 20),
        //                   ),
        //                   Text(
        //                     "100 Musics",
        //                     style: TextStyle(fontSize: 16),
        //                   )
        //                 ],
        //               )),
        //         ],
        //       ),
        //     ),

        //   ],
        // )
        );
  }
}
