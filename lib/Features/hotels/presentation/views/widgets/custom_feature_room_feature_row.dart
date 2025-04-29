import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/services_hotel_details_cubit/services_hotel_details_cubit.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_card_feature_room.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

import '../../../../../core/utils/styles.dart';

// ignore: must_be_immutable
class CustomFeatureRoomFeaturesGrid extends StatelessWidget {
  CustomFeatureRoomFeaturesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesHotelDetailsCubit, ServicesHotelDetailsState>(
      builder: (context, state) {
        if (state is ServicesHotelDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ServicesHotelDetailsFailure) {
          CustomSnackBar.show(context, state.errmessage.toString(),
              isError: true);
          return const Center(
            child: Text(
              "No data",
              style: Styles.textStyle22,
            ),
          );
        } else if (state is ServicesHotelDetailsSucess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 14,
                childAspectRatio: 4.5),
            itemCount: state.servicesHotelDetailsModel.length,
            itemBuilder: (context, index) {
              return CustomCardFeatureRoom(
                icon: state.servicesHotelDetailsModel[index].iconName! ??
                    'help_center',
                text: state.servicesHotelDetailsModel[index].name!,
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
