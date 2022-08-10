import 'package:album_image/album_image.dart';
import 'package:flutter/material.dart';

class AlbumImageScreen extends StatefulWidget {
  const AlbumImageScreen({Key? key}) : super(key: key);

  @override
  _AlbumImageScreenState createState() => _AlbumImageScreenState();
}

class _AlbumImageScreenState extends State<AlbumImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final thumbnailQuality = MediaQuery.of(context).size.width ~/ 3;
          return AlbumImagePicker(
            onSelected: (items) {},
            iconSelectionBuilder: (_, selcted, index) {
              if (selcted) {
                return CircleAvatar(
                  radius: 10,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 10,
                      height: 1.4,
                    ),
                  ),
                );
              }
              return Container();
            },
            crossAxisCount: 3,
            maxSelection: 4,
            onSelectedMax: () {
              print('Reach max');
            },
            albumBackGroundColor: Colors.grey,
            appBarHeight: 45,
            itemBackgroundColor: Colors.white,
            albumTextStyle: const TextStyle(color: Colors.black, fontSize: 14),
            albumSubTextStyle: const TextStyle(color: Colors.black),
            thumbnailQuality: thumbnailQuality * 3,
          );
        },
      ),
    );
  }
}
