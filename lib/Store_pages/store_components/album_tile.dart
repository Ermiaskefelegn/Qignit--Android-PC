import 'package:flutter/material.dart';
import 'package:qignit_music_player/Store_pages/single_component.dart';
import 'package:qignit_music_player/utils/FadePageRoute.dart';

class Albumtile extends StatefulWidget {
  @override
  _AlbumtileState createState() => _AlbumtileState();
}

class _AlbumtileState extends State<Albumtile> {
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
              title: Text("Album Title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              subtitle: Text("Album Artist"),
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
