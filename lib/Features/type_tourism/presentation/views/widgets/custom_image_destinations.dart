import 'package:flutter/material.dart';
import 'package:sntegpito/core/api/end_ponits.dart';

class CustomImageDestinations extends StatelessWidget {
  const CustomImageDestinations({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final String backupUrl = imageUrl.replaceFirst(
      EndPoint.baseImageUrl,
      EndPoint.baseImageDash,
    );

    return SizedBox(
      height: 114,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              backupUrl,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/placeholder.jpg',
                  fit: BoxFit.fill,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

/**
 * import 'package:flutter/material.dart';

class CustomImageDestinations extends StatelessWidget {
  const CustomImageDestinations({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      // width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
 */
