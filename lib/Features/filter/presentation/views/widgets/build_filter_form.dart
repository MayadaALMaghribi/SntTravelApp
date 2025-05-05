import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/filter/presentation/manager/filter_by_date_and_gests/hotel_filter_cubit.dart';
import 'package:sntegpito/Features/filter/presentation/views/widgets/custom_build_rating_button.dart';
import 'package:sntegpito/Features/filter/presentation/views/widgets/custom_date_picker.dart';
import 'package:sntegpito/Features/filter/presentation/views/widgets/custom_drop_down_textfield.dart';
import 'package:sntegpito/Features/filter/presentation/views/widgets/price_range.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

class BuildFilterForm extends StatelessWidget {
  const BuildFilterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // عشان الصفحه متتمددش بطريقه كبيره
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ال top bar x    room details
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.close, size: 24),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              "Filter",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 40),
          ],
        ),
        const SizedBox(height: 51),

        //Date
        Row(
          children: [
            Expanded(
                child: CustomDatePicker(
              label: "From",
              textController: context.read<HotelFilterCubit>().startDateText,
            )),
            const SizedBox(width: 10),
            Expanded(
                child: CustomDatePicker(
              label: "To",
              textController: context.read<HotelFilterCubit>().endDateText,
            )),
          ],
        ),
        const SizedBox(height: 27),

        // rooms & guests
        Row(
          children: [
            Expanded(
                child: CustomDropDownTextfield(
              label: "Rooms",
              textEditingController: context.read<HotelFilterCubit>().roomsText,
            )),
            const SizedBox(width: 10),
            Expanded(
                child: CustomDropDownTextfield(
              label: "Guests",
              textEditingController:
                  context.read<HotelFilterCubit>().guestsText,
            )),
          ],
        ),
        const SizedBox(height: 39),

        // choose rating
        const Text(
          "Rating",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        CustomBuildRatingButton(
          onRatingSelected: (int rating) {
            context.read<HotelFilterCubit>().updateRating(rating);
          },
        ),
        const SizedBox(height: 39),

        // price range
        const Text(
          "Price range",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 24,
        ),

        PriceRange(
          onPriceChanged: (min, max) {
            context.read<HotelFilterCubit>().updatePriceRange(min, max);
          },
        ),

        // apply button
        const SizedBox(height: 39),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              await context.read<HotelFilterCubit>().filterHotelsByDate();
              Future.microtask(() => Navigator.pop(context));
              CacheHelper().saveData(
                  key: Constants.fromDate,
                  value: context.read<HotelFilterCubit>().startDateText.text);
              print("START DATE" +
                  CacheHelper().getData(key: Constants.fromDate));
              CacheHelper().saveData(
                  key: Constants.toDate,
                  value: context.read<HotelFilterCubit>().endDateText.text);
              CacheHelper().saveData(
                  key: Constants.guests,
                  value: int.parse(
                    context.read<HotelFilterCubit>().guestsText.text,
                  ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff247CFF),
              foregroundColor: Colors.white,
              fixedSize: const Size(304, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Apply filters",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
