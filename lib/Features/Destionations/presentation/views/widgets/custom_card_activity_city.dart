import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Destionations/data/models/activites_for_cities_model.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_card_activity_image.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/rating_test.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/utils/styles.dart';

class CustomCardActivityCity extends StatelessWidget {
  const CustomCardActivityCity(
      {super.key, required this.activitesforcitiesModel});
  final ActivitesforcitiesModel activitesforcitiesModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Container(
          width: 350,
          height: 265,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xff868686), width: 1),
          ),
          child: Column(
            children: [
              CustomCardActivityImage(
                imageUrl:
                    "${EndPoint.baseImageUrl}${activitesforcitiesModel.imageUrl!}",
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 12, right: 12, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      activitesforcitiesModel.name!,
                      style: Styles.textStyle17.copyWith(fontSize: 20),
                    ),
                    Text(
                      activitesforcitiesModel.price!.toString(),
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 14),
                child: Text(
                  activitesforcitiesModel.description!,
                  style: Styles.textStyle12,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: RatingTest(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
