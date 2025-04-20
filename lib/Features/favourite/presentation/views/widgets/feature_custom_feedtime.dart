import 'package:flutter/material.dart';
import 'package:sntegpito/Features/favourite/presentation/views/widgets/custom_card_feedtime_image.dart';
import '../../../../../core/utils/styles.dart';

class FeatureCustomFeedtime extends StatelessWidget {
  const FeatureCustomFeedtime({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomCardFeedtimeImage(),
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 19),
              const Text(
                "headTiltle",
                style: Styles.textStyle17,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "title",
                style: Styles.textStyle20
                    .copyWith(color: Colors.black.withOpacity(0.4)),
              ),
              const SizedBox(height: 10),
              Text(
                "subtitle",
                style: Styles.textStyle15
                    .copyWith(color: Colors.black.withOpacity(0.5)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close_outlined),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
