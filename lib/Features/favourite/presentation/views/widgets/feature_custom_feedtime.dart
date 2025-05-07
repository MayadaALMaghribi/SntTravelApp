import 'package:flutter/material.dart';
import 'package:sntegpito/Features/favourite/presentation/views/widgets/custom_card_feedtime_image.dart';
import '../../../../../core/utils/styles.dart';

class FeatureCustomFeedtime extends StatelessWidget {
  const FeatureCustomFeedtime(
      {super.key,
      required this.image,
      required this.headName,
      required this.add,
      required this.price});
  final String image;
  final String headName;
  final String add;
  final String price;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCardFeedtimeImage(image: image),
          Expanded(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 19),
                Text(
                  headName,
                  style: Styles.textStyle17.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  add,
                  maxLines: 1,
                  style: Styles.textStyle16.copyWith(
                    //overflow: TextOverflow.ellipsis,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  price,
                  style: Styles.textStyle15
                      .copyWith(color: Colors.black.withOpacity(0.5)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
          // const Spacer(),
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
