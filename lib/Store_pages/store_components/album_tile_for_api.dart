import 'package:flutter/material.dart';
import 'package:qignit_music_player/Store_pages/single_component.dart';
import 'package:qignit_music_player/utils/FadePageRoute.dart';

class Albumtileapi extends StatelessWidget {
  final String album_title;
  final String artist_name;

  const Albumtileapi({Key key, this.album_title, this.artist_name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, FadePageRoute(widget: Singlecomponent()));
      },
      child: Container(
        child: Column(
          children: [
            ListTile(
              dense: false,
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.deepOrange,
              ),
              title: Text(album_title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              subtitle: Text(artist_name),
              onTap: () {
                Navigator.push(
                    context, FadePageRoute(widget: Singlecomponent()));
              },
              trailing: Icon(Icons.chevron_right, color: Colors.red),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Divider(
                thickness: 1.5,
                height: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
