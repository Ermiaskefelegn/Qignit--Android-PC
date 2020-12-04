import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:qignit_music_player/appbar.dart';

typedef void OnError(Exception exception);
const kUrl = "Any Url Here !";

enum PlayerState { stopped, playing, paused }

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  double _value = 0;
  var _songs;
  Duration duration;
  Duration position;

  MusicFinder audioPlayer;

  String localFilePath;

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }

  Future initAudioPlayer() async {
    audioPlayer = new MusicFinder();
    var songs;
    try {
      songs = await MusicFinder.allSongs();
    } catch (e) {
      print(e.toString());
    }

    print(songs);
    audioPlayer.setDurationHandler((d) => setState(() {
          duration = d;
        }));

    audioPlayer.setPositionHandler((p) => setState(() {
          position = p;
        }));

    audioPlayer.setCompletionHandler(() {
      onComplete();
      setState(() {
        position = duration;
      });
    });

    audioPlayer.setErrorHandler((msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = new Duration(seconds: 0);
        position = new Duration(seconds: 0);
      });
    });

    setState(() {
      print(songs.toString());
      _songs = songs;
    });
  }

  Future play() async {
    final result = await audioPlayer.play(_songs.uri);
    if (result == 1)
      setState(() {
        print('_AudioAppState.play... PlayerState.playing');
        playerState = PlayerState.playing;
      });
  }

  Future _playLocal() async {
    final result = await audioPlayer.play(localFilePath, isLocal: true);
    if (result == 1) setState(() => playerState = PlayerState.playing);
  }

  Future pause() async {
    final result = await audioPlayer.pause();
    if (result == 1) setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    final result = await audioPlayer.stop();
    if (result == 1)
      setState(() {
        playerState = PlayerState.stopped;
        position = new Duration();
      });
  }

  Future mute(bool muted) async {
    final result = await audioPlayer.mute(muted);
    if (result == 1)
      setState(() {
        isMuted = muted;
      });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppbar(
        pagetitle: "Now Playing",
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: MediaQuery.of(context).size.height / 2.1,
              color: Colors.black,
              child: Image.asset("assets/IMG_3848.JPG")),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, right: 10),
                child: Text(
                  position != null
                      ? "${positionText ?? ''}  ${durationText ?? ''}"
                      : duration != null ? durationText : '',
                ),
              ),
              Container(
                color: Colors.grey,
                height: 5,
                width: MediaQuery.of(context).size.height / 2.7,
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Center(child: Text("Mikael Track 7: የፍቅር ትንታ"))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: IconButton(
                      icon: Icon(
                        Icons.fast_rewind,
                        size: 40,
                      ),
                      onPressed: () {})),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: isPlaying
                      ? IconButton(
                          icon: Icon(
                            Icons.pause_circle_filled,
                            size: 40,
                          ),
                          onPressed: () => pause())
                      : IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            size: 40,
                          ),
                          onPressed: () => play())),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: IconButton(
                      icon: Icon(
                        Icons.fast_forward,
                        size: 40,
                      ),
                      onPressed: () {})),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    child: IconButton(
                        icon: Icon(
                          Icons.volume_down,
                        ),
                        onPressed: () {})),
                new Container(
                  padding: new EdgeInsets.all(12.0),
                  child: LinearProgressIndicator(
                    value: position != null && position.inMilliseconds > 0
                        ? (position?.inMilliseconds?.toDouble() ?? 0.0) /
                            (duration?.inMilliseconds?.toDouble() ?? 0.0)
                        : 0.0,
                    valueColor: new AlwaysStoppedAnimation(Colors.cyan),
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    child: IconButton(
                        icon: Icon(
                          Icons.volume_up,
                        ),
                        onPressed: () {}))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Repeat",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Shuffle", style: TextStyle(color: Colors.red))),
            ],
          ),
        ],
      ),
    );
  }
}
