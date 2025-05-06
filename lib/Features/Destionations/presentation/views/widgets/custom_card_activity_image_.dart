import 'package:flutter/material.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/widgets/custom_function_cart.dart';

class CustomCardActivityImage extends StatelessWidget {
  const CustomCardActivityImage(
      {super.key, required this.imageUrl, required this.activityId});
  final String imageUrl;
  final int activityId;

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
                  color: Colors.black45,
                  shape: BoxShape.circle,
                ),
                child: CustomFunctionCart(
                  activityId: activityId,
                  numOfGeusts:
                      CacheHelper().getData(key: Constants.guests) ?? 1,
                  userId: Constants.userid,
                )),
          ),
        ],
      ),
    );
  }
}
