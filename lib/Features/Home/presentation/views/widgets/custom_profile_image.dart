import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.icon,
    required this.image,
    required this.radiusg,
    required this.radiuss,
    required this.fun,
  });
  final dynamic image;
  final IconData icon;
  final double radiusg;
  final double radiuss;
  final Function fun;
  @override
  Widget build(BuildContext context) {
    // final base = "http://tourism.runasp.net/";
    // final imageurl = Uri.encodeFull("${base}${image ?? ''}");
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: radiusg, //100
          child: CircleAvatar(
            radius: radiuss, //95
            backgroundImage: image is String ? NetworkImage(image):image,
          ),
        ),
        Positioned(
          bottom: 12, // قريب من الحافة السفلى
          right: 25, // قريب من الحافة اليمنى
          child: InkWell(
            onTap: ()=>fun(),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(5),
              child: Icon(
                icon, // أيقونة الكاميرا
                color: Colors.white,
                size: 18, // تصغير الأيقونة
              ),
            ),
          ),
        ),
      ],
    );
  }
}
