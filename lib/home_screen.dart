import 'package:camera/camera.dart';
import 'package:camera_app/album/album_image_screen.dart';
import 'package:camera_app/camera/camera_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AlbumImageScreen(),
                  ),
                );
              },
              child: const Text(
                'アルバム',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CameraScreen(camera: camera),
                  ),
                );
              },
              child: const Text(
                'カメラ',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
