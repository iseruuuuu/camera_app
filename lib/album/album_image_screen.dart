import 'dart:io';

import 'package:album_image/album_image.dart';
import 'package:camera_app/post/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'album_types.dart';
import 'album_image_picker.dart';

// import 'package:exif/exif.dart';
import 'package:photo_manager/photo_manager.dart';



class AlbumImageScreen extends StatefulWidget {
  const AlbumImageScreen({Key? key}) : super(key: key);

  @override
  _AlbumImageScreenState createState() => _AlbumImageScreenState();
}

class _AlbumImageScreenState extends State<AlbumImageScreen> {
  @override
  void initState() {
    super.initState();



  }

  var latitude = '';
  var longitude = '';
  var time = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade800,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PostScreen(
                    time: time,
                    latitude: latitude,
                    longitude: longitude,
                  ),
                ),
              );
            },
            child: const Text('次へ'),
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          return AlbumImagePick(

            appBarHeight: 0,
            onSelected: (items) async {
              if (items.isNotEmpty) {
                //座標
                print(items[0].latitude);
                print(items[0].longitude);

                //撮影した時間
                print(items[0].createDateTime);

                print(items[0].isLivePhoto);
                // print(items[0].height);
                // print(items[0].size);
                // print(items[0].width);
                // print(items[0].relativePath);
                print(items[0].orientation);
                // print(items[0].mimeType);
                print(items[0].duration);
                // print(items[0].file.toString());
                print(items[0].type.name);
                // print(items[0].fileWithSubtype);
                // print(items[0].title);
                print(items[0].id);
                print(items[0].createDateSecond);
                print(items[0].modifiedDateTime);
                print(items[0].subtype);
                print(items[0].runtimeType);

                print(items[0].typeInt);

                time = items[0].createDateTime.toString();
                latitude = items[0].latitude.toString();
                longitude = items[0].longitude.toString();
              }
            },
            iconSelectionBuilder: (_, select, index) {
              if (select) {
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
            onSelectedMax: () => print('Reach max'),
          );
        },
      ),
    );
  }
}
