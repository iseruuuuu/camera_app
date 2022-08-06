import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'display_picture_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void takePhoto() async {
    final image = await controller.takePicture();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(
          imagePath: image.path,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(controller);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            ElevatedButton(
              onPressed: takePhoto,
              child: const Icon(Icons.photo_camera),
            ),
          ],
        ),
      ),
    );
  }
}
