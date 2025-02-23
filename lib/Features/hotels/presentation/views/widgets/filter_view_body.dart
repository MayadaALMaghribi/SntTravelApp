import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_date_picker.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_drop_down_textfield.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_build_rating_button.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/price_range.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent, // عشان يخلي الخلفيه الى قبلها شفافه
        child: Container(
          height:
              MediaQuery.of(context).size.height * 0.8, // 80 في الميه من الطول
          width:
              MediaQuery.of(context).size.width * 0.9, // 90 في الميه من العرض
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
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
                    "Room details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 51),

              //Date
              Row(
                children: [
                  Expanded(child: CustomDatePicker(label: "From")),
                  const SizedBox(width: 10),
                  Expanded(child: CustomDatePicker(label: "To")),
                ],
              ),
              const SizedBox(height: 27),

              // rooms & guests
              Row(
                children: [
                  Expanded(child: CustomDropDownTextfield(label: "Rooms")),
                  const SizedBox(width: 10),
                  Expanded(child: CustomDropDownTextfield(label: "Guests")),
                ],
              ),
              const SizedBox(height: 39),

              // choose rating
              const Text(
                "Rating",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const CustomBuildRatingButton(),
              const SizedBox(height: 39),

              // price range
              const Text(
                "Price range",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),

              const PriceRange(),

              // apply button
              const SizedBox(height: 39),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
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
          ),
        ),
      ),
    );
  }
}
