import 'package:flutter/material.dart';
import 'package:sntegpito/Features/medical/presentation/views/widgets/custom_image_destinations_medical.dart';
import 'package:sntegpito/core/utils/styles.dart';

class FeatureCardDestinationsMedical extends StatelessWidget {
  const FeatureCardDestinationsMedical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
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
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 6),
            child: CustomImageDestinationsMedical(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.place_outlined, size: 22),
              Text("New Alamine city", style: Styles.textStyle17),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text("every city has a story waiting for you to explore!",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle12)
        ],
      ),
    );
  }
}
