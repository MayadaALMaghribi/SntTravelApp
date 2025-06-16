import 'package:flutter/material.dart';
import 'package:sntegpito/Features/type_tourism/data/models/image_discount_tourism_model.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/utils/styles.dart';

class CustomImageEntertainmentTop extends StatelessWidget {
  const CustomImageEntertainmentTop({super.key, required this.imagemodel});
  final ImageDiscountTourismModel imagemodel;

  @override
  Widget build(BuildContext context) {
    final String ur1 = "http://tourism.runasp.net/${imagemodel.imageUrl}";
    final String ur2 =
        "https://dashboard-samar.runasp.net${imagemodel.imageUrl}";

    return SizedBox(
      height: 185,
      child: AspectRatio(
        aspectRatio: 17 / 7,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "http://tourism.runasp.net/${imagemodel.imageUrl}",
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "${EndPoint.baseImageDash}${imagemodel.imageUrl}",
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/placeholder.jpg', // صورة افتراضية
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              left: 21,
              right: 155,
              top: 25,
              bottom: 24,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: imagemodel.message,
                      style: Styles.textStyle22,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/**
 * import 'package:flutter/material.dart';
import 'package:sntegpito/Features/type_tourism/data/models/image_discount_tourism_model.dart';
import 'package:sntegpito/core/utils/styles.dart';

class CustomImageEntertainmentTop extends StatelessWidget {
  const CustomImageEntertainmentTop({super.key, required this.imagemodel});
  final ImageDiscountTourismModel imagemodel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: AspectRatio(
        aspectRatio: 17 / 7,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "http://tourism.runasp.net/${imagemodel.imageUrl}"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            left: 21,
            right: 155,
            top: 25,
            bottom: 24,
            child: RichText(
                text: TextSpan(
              children: [
                TextSpan(
                  text: imagemodel.message,
                  style: Styles.textStyle22,
                ),
              ],
            )),
          )
        ]),
      ),
    );
  }
}

 */
