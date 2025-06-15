import 'package:flutter/material.dart';
import 'package:sntegpito/Features/type_tourism/data/models/image_discount_tourism_model.dart';
import 'package:sntegpito/core/utils/styles.dart';

class CustomImageMedicalTop extends StatelessWidget {
  const CustomImageMedicalTop({super.key, required this.imagemodel});
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
