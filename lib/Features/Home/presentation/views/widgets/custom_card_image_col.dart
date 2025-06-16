import 'package:flutter/material.dart';
import 'package:sntegpito/core/api/end_ponits.dart';

class CustomCardImageCol extends StatelessWidget {
  const CustomCardImageCol({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final String url1 = "${EndPoint.baseImageUrl}$imagePath";
    final String url2 = "${EndPoint.baseImageDash}$imagePath";
    //http://dashboardsamar.runasp.net/images/Home/samar.jpeg

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Image.network(
        url1,
        width: double.infinity,
        height: 220,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.network(
            url2,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/activity_trip.jpg", // صورة افتراضية عندك في المشروع
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              );
            },
          );
        },
      ),
    );
  }
}

/**
 * import 'package:flutter/material.dart';

class CustomCardImageCol extends StatelessWidget {
  const CustomCardImageCol({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Image(
        image: NetworkImage( imageUrl),
        width: double.infinity,
        height: 220,
        fit: BoxFit.cover,
      ),
    );
  }
}
 */
