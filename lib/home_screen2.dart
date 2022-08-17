// import 'dart:io';
//
// import 'package:camera/camera.dart';
// import 'package:camera_app/album/album_image_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'display_picture_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({
//     Key? key,
//     // required this.camera,
//   }) : super(key: key);
//
//   // final CameraDescription camera;
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   // late CameraController controller;
//   // late Future<void> _initializeControllerFuture;
//
//   late File _image;
//   final picker = ImagePicker();
//
//   @override
//   void initState() {
//     super.initState();
//
//     _image = File(
//         '/Users/ryutaroiseki/Library/Developer/CoreSimulator/Devices/D8FAECF6-FE17-4D2C-AE75-8C53D37A3A8B/data/Containers/Data/Application/0FEDF933-F6FB-4DF4-8A24-BF77EA3CD8EC/tmp/image_picker_24A65B76-EEFA-41E6-8620-EE2D80F77A79-2272-00000180BCD28F38.jpg');
//
//     // controller = CameraController(widget.camera, ResolutionPreset.medium);
//     // _initializeControllerFuture = controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     // controller.dispose();
//     super.dispose();
//   }
//
//   void takePhoto() async {
//     // final image = await controller.takePicture();
//     // await Navigator.of(context).push(
//     //   MaterialPageRoute(
//     //     builder: (context) => DisplayPictureScreen(
//     //       imagePath: image.path,
//     //     ),
//     //     fullscreenDialog: true,
//     //   ),
//     // );
//   }
//
//   void getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//
//     setState(() {
//       _image = File(pickedFile!.path);
//     });
//
//     print(_image);
//
//     print(_image.path);
//     print(_image.hashCode);
//     print(_image.isAbsolute);
//     print(_image.absolute);
//     print(_image.parent);
//     print(_image.runtimeType);
//     print(_image.uri);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.zero,
//         child: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.black,
//         ),
//       ),
//       backgroundColor: Colors.grey.shade800,
//       body: Center(
//         child: Column(
//           children: [
//             // FutureBuilder<void>(
//             //   future: _initializeControllerFuture,
//             //   builder: (context, snapshot) {
//             //     if (snapshot.connectionState == ConnectionState.done) {
//             //       return CameraPreview(controller);
//             //     } else {
//             //       return const CircularProgressIndicator();
//             //     }
//             //   },
//             // ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width * 1.5,
//               color: Colors.grey,
//               child: const Center(
//                 child: Text('カメラ'),
//               ),
//             ),
//             //
//             // Padding(
//             //   padding: const EdgeInsets.all(8.0),
//             //   child: Container(
//             //       width: 300,
//             //       child: _image == null
//             //           ? const Text('No image selected.')
//             //           : Image.file(_image)),
//             // ),
//
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //   children: [
//             //     ElevatedButton(
//             //       onPressed: takePhoto,
//             //       child: const Icon(Icons.photo_camera),
//             //     ),
//             //     ElevatedButton(
//             //       onPressed: getImage,
//             //       child: const Icon(Icons.photo_size_select_actual),
//             //     ),
//             //   ],
//             // ),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   width: 100,
//                   height: 100,
//                 ),
//
//                 Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Container(
//                       width: 100,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         print('パシャ!');
//                       },
//                       child: Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//
//                 // SizedBox(
//                 //   width: 100,
//                 //   height: 100,
//                 //   child: Container(
//                 //     width: 70,
//                 //     height: 70,
//                 //     decoration: BoxDecoration(
//                 //       borderRadius: BorderRadius.circular(100),
//                 //       color: Colors.grey.shade700,
//                 //     ),
//                 const SizedBox(),
//                 CircleAvatar(
//                   radius: 40,
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => AlbumImageScreen(),
//                         ),
//                       );
//                     },
//                     icon: Icon(
//                       Icons.photo_size_select_actual,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
