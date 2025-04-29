import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Home/data/model/tourism_type_model.dart';
import 'package:sntegpito/Features/Home/presentation/views/archaeological_tourism.dart';
import 'package:sntegpito/Features/Home/presentation/views/environmental_tourism.dart';
import 'package:sntegpito/Features/Home/presentation/views/regligious_tourism.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/custom_card_image_col.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/entertainment_view.dart';
import 'package:sntegpito/Features/medical/presentation/views/medical_view.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/utils/styles.dart';
import 'package:sntegpito/core/widgets/custom_function_favourite.dart';

import '../../../../../core/widgets/custom_snak_bar.dart';
import '../../../../favourite/presentation/manager/addfovuritecubit/addfovurite_cubit.dart';

class CustomCardColumn extends StatelessWidget {
  final TourismTypeModel tourismType;

  const CustomCardColumn({super.key, required this.tourismType});
  @override
  Widget build(BuildContext context) {
    final List<Widget> tourismViews = [
      const EntertainmentView(),
      const MedicalView(),
      const ReligiousTourism(),
      const EnvironmentalTourism(),
      const ArchaeologicalTourism(),
    ];

    return BlocListener<AddfovuriteCubit, AddfovuriteState>(
      listener: (context, state) {
        if (state is AddfovuriteSucess) {
          CustomSnackBar.show(context, state.sucessmessage);
        } else if (state is RemovefavSucess) {
          CustomSnackBar.show(context, state.errorModel.errorMessage);
        } else if (state is RemovefavFailure || state is AddfovuriteFailure) {
          CustomSnackBar.show(
            context,
            (state is AddfovuriteFailure)
                ? state.errmessage
                : (state as RemovefavFailure).errorModel.errorMessage,
            isError: true,
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          CacheHelper()
              .saveData(key: 'selected_tourism_id', value: tourismType.id);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => tourismViews[tourismType.id! - 1],
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: 450,
          height: 310,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xff868686), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCardImageCol(
                imageUrl: "http://tourism.runasp.net/${tourismType.imageUrl}",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tourismType.name!,
                      style: Styles.textStyle17.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tourismType.description!,
                      style: Styles.textStyle12,
                    ),
                    CustomFunctionFavourite(
                      indexIdFav: tourismType.id!,
                      itemTypefav: "TourismType",
                      userIdfav: Constants.useridFav,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
