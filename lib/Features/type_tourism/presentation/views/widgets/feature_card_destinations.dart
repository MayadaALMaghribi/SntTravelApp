import 'package:flutter/material.dart';
import 'package:sntegpito/Features/type_tourism/data/models/top_destinations_model.dart';
import 'package:sntegpito/Features/type_tourism/presentation/views/widgets/custom_image_destinations.dart';
import 'package:sntegpito/core/utils/styles.dart';

class FeatureCardDestinations extends StatelessWidget {
  const FeatureCardDestinations({super.key, required this.topDestinationModel});
  final TopDestinationModel topDestinationModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 7.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 6),
            child: CustomImageDestinations(
              imageUrl:
                  "http://tourism.runasp.net/${topDestinationModel.imageUrl!}",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.place_outlined, size: 22),
              Flexible(
                child: Text(
                  topDestinationModel.name!,
                  style: Styles.textStyle17,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(topDestinationModel.description!,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: Styles.textStyle12)
        ],
      ),
    );
  }
}
