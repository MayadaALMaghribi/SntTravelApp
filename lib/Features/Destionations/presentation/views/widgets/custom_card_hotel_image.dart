import 'package:flutter/material.dart';
import 'package:sntegpito/core/api/end_ponits.dart';

class CustomCardHotelImage extends StatelessWidget {
  const CustomCardHotelImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final String backupUrl = imageUrl.replaceFirst(
      EndPoint.baseImageUrl,
      EndPoint.baseImageDash,
    );

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 140,
        errorBuilder: (context, error, stackTrace) {
          return Image.network(
            backupUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 140,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/images/activity_trip.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 140,
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

class CustomCardHotelImage extends StatelessWidget {
  const CustomCardHotelImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      child: Image(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 140,
      ),
    );
  }
}
 */
