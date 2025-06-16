import 'package:flutter/material.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/widgets/custom_function_cart.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/utils/constant.dart';

class CustomCardActivityImage extends StatelessWidget {
  const CustomCardActivityImage({
    super.key,
    required this.imageUrl,
    required this.activityId,
    required this.numOfGuests,
  });

  final String imageUrl;
  final int activityId;
  final int numOfGuests;

  @override
  Widget build(BuildContext context) {
    // رابط بديل
    final String backupUrl = imageUrl.replaceFirst(
      EndPoint.baseImageUrl,
      EndPoint.baseImageDash,
    );

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Stack(
        children: [
          // المحاولة الأولى بالرابط الأساسي
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 140,
            errorBuilder: (context, error, stackTrace) {
              // المحاولة الثانية بالرابط البديل
              return Image.network(
                backupUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 140,
                errorBuilder: (context, error, stackTrace) {
                  // fallback
                  return Image.asset(
                    'assets/images/placeholder.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 140,
                  );
                },
              );
            },
          ),
          // زر الإضافة للكارت
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: CustomFunctionCart(
                activityId: activityId,
                numOfGeusts: numOfGuests,
                userId: CacheHelper().getData(key: Constants.userId),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * import 'package:flutter/material.dart';
import 'package:sntegpito/core/widgets/custom_function_cart.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/utils/constant.dart';

class CustomCardActivityImage extends StatelessWidget {
  const CustomCardActivityImage(
      {super.key,
      required this.imageUrl,
      required this.activityId,
      required this.numOfGuests});
  final String imageUrl;
  final int activityId;
  final int numOfGuests;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Stack(
        children: [
          Image(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 140,
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: CustomFunctionCart(
                  activityId: activityId,
                  numOfGeusts: numOfGuests,
                  userId: CacheHelper().getData(key: Constants.userId),
                )),
          ),
        ],
      ),
    );
  }
}

 */