import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../album/album_image_screen.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';

class CameraPreviewScreen extends StatefulWidget {
  const CameraPreviewScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  final XFile image;

  @override
  _CameraPreviewScreenState createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  void storeImage() async {
    Uint8List buffer = await widget.image.readAsBytes();
    final result = await ImageGallerySaver.saveImage(buffer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.file(
              File(widget.image.path),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Stack(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 30),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AlbumImageScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(),
                            ],
                          ),
                        ),
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 10,
                                  ),
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        print('保存するよ〜');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.white,
                      ),
                      child: const Text(
                        '次へ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
