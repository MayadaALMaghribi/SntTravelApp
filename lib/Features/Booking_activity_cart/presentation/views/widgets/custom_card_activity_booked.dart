import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Booking_activity_cart/data/models/all_activity_cart_model.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/add_cart/cart_cubit.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/views/widgets/custom_image_activity_booked.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';

class CustomCardActivityBooked extends StatelessWidget {
  const CustomCardActivityBooked({super.key, required this.data});
  final Data data;

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
              imageUrl: data.image ?? '',
            ),
          ),

          const SizedBox(width: 12),

          // المحتوى
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.activityName ?? '',
                  style:
                      Styles.textStyle17.copyWith(fontWeight: FontWeight.w800),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  "${data.pricePerPerson ?? 0} EGP/Person",
                  style: Styles.textStyle15
                      .copyWith(color: Colors.black.withOpacity(0.7)),
                ),
                const SizedBox(height: 6),
                Text(
                  "${data.peopleCount ?? 0} Guests",
                  style: Styles.textStyle15
                      .copyWith(color: Colors.black.withOpacity(0.5)),
                ),
                const SizedBox(height: 6),
                Text(
                  data.locationNames?.join(', ') ?? 'No locations',
                  style: Styles.textStyle15
                      .copyWith(color: Colors.black.withOpacity(0.5)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),

          // زر الإغلاق
          IconButton(
            onPressed: () {
              context.read<CartCubit>().removeFromCart(
                  userId: CacheHelper().getData(key: Constants.userId),
                  activityId: data.activityId!,
                  context: context);
              CacheHelper().saveData(
                  key: "${data.peopleCount}_${data.activityId!}", value: false);
            },
            icon: const Icon(Icons.close_outlined),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
