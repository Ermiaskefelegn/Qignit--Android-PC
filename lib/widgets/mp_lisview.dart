import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qignit_music_player/data/song_data.dart';
import 'package:qignit_music_player/pages/now_playing.dart';
import 'package:qignit_music_player/widgets/mp_circle_avatar.dart';
import 'package:qignit_music_player/widgets/mp_inherited.dart';

class MPListView extends StatelessWidget {
  final List<MaterialColor> _colors = Colors.primaries;
  @override
  Widget build(BuildContext context) {
    final rootIW = MPInheritedWidget.of(context);
    SongData songData = rootIW.songData;
    return new ListView.builder(
      itemCount: songData.songs.length,
      itemBuilder: (context, int index) {
        var s = songData.songs[index];
        final MaterialColor color = _colors[index % _colors.length];
        var artFile =
            s.albumArt == null ? null : new File.fromUri(Uri.parse(s.albumArt));

        return Column(
          children: [
            new ListTile(
              dense: false,
              leading: avatar(artFile, s.title, color),
              title: new Text(s.title),
              subtitle: new Text(
                "By ${s.artist}",
                style: Theme.of(context).textTheme.caption,
              ),
              onTap: () {
                songData.setCurrentIndex(index);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new NowPlaying(songData, s)));
              },
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Divider(
                thickness: 1.5,
                height: 10.0,
              ),
            ),
          ],
        );
      },
    );
  }
}
