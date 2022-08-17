import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({
    Key? key,
    required this.time,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final String time;
  final String latitude;
  final String longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('座標は'),
              Text(latitude),
              Text(longitude),
            ],
          ),
          Row(
            children: [
              Text('撮影された時間は'),
              Text(time),
            ],
          ),
        ],
      ),
    );
  }
}
