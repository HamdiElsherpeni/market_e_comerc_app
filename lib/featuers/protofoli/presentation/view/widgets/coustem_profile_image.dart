import 'package:flutter/material.dart';

class CoustemProfileImage extends StatelessWidget {
  const CoustemProfileImage({super.key, required this.urlImage});
final String urlImage;
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blueAccent,
        child: CircleAvatar(
          radius: 29,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: 55, // صغرتها
              height: 55,
            ),
          ),
        ),
      );
  }
}