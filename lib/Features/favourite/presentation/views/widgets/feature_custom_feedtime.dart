import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/favourite/presentation/manager/fovuritecubit/fovurite_cubit.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../Booking_activity_cart/presentation/views/widgets/custom_image_activity_booked.dart';

class FeatureCustomFeedtime extends StatelessWidget {
  const FeatureCustomFeedtime(
      {super.key,
      required this.image,
      required this.headName,
      required this.add,
      required this.price,
      required this.itemfav,
      required this.typefav});
  final String image;
  final String headName;
  final String add;
  final String price;
  final int itemfav;
  final String typefav;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصورة
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomImageActivityBooked(
              imageUrl: image ?? '',
            ),
          ),

          const SizedBox(width: 12),

          // المحتوى
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headName ?? '',
                  style:
                      Styles.textStyle17.copyWith(fontWeight: FontWeight.w800),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  "${add ?? 0} ",
                  style: Styles.textStyle15
                      .copyWith(color: Colors.black.withOpacity(0.7)),
                ),
                const SizedBox(height: 6),
                Text(
                  "${price ?? 0} EGP/Person",
                  style: Styles.textStyle15
                      .copyWith(color: Colors.black.withOpacity(0.5)),
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),

          // زر الإغلاق
          IconButton(
            onPressed: () {
              context.read<FovuriteCubit>().RemoveFav(
                  itemIdfav: itemfav,
                  userIdfav: CacheHelper().getData(key: Constants.userId),
                  itemTypefav: typefav,
                  context: context);
              CacheHelper()
                  .saveData(key: "${typefav}_${itemfav}", value: false);
            },
            icon: const Icon(Icons.close_outlined),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
