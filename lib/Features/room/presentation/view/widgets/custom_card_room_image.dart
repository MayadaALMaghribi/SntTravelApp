import 'package:flutter/material.dart';
import 'package:sntegpito/core/api/end_ponits.dart';

class CustomCardRoomImage extends StatelessWidget {
  const CustomCardRoomImage({super.key, required this.imageurl});
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    final String backupUrl =
        imageurl.replaceFirst(EndPoint.baseImageUrl, EndPoint.baseImageDash);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Image.network(
        imageurl,
        width: double.infinity,
        height: 170,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.network(
            backupUrl,
            width: double.infinity,
            height: 170,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/images/activity_trip.jpg',
                width: double.infinity,
                height: 170,
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

class CustomCardRoomImage extends StatelessWidget {
  const CustomCardRoomImage({super.key, required this.imageurl});
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Image.network(
        imageurl,
        width: double.infinity,
        height: 170,
        fit: BoxFit.cover,
      ),
    );
  }
}
 */
