import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:qignit_music_player/Store_pages/store_components/image_holeder.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  List assets = [
    {"imageassets": "assets/box_1_img.jpg"},
    {"imageassets": "assets/box_1.jpg"},
    {"imageassets": "assets/box_2.jpg"},
    {"imageassets": "assets/home_1.jpg"},
    {"imageassets": "assets/home_2.jpg"},
    // {"imageassets": "assets/music_record.jpg"},
    // {"imageassets": "assets/music_record.jpg"},
    // {"imageassets": "assets/music_record.jpg"},
    // {"imageassets": "assets/music_record.jpg"},
    // {"imageassets": "assets/music_record.jpg"},
    // {"imageassets": "assets/music_record.jpg"},
    // {"imageassets": "assets/music_record.jpg"},
    // {"imageassets": "assets/music_record.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemBuilder: (context, index) {
          return Imageholer(
            assetname: (assets[index]["imageassets"]),
          );
        },
        options: CarouselOptions(
            height: 152,
            initialPage: 0,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayInterval: Duration(seconds: 8),
            enlargeCenterPage: true,
            autoPlay: true),
        itemCount: assets.length);
  }
}
