import 'package:flutter/material.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/custom_image_home.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/custom_row_text.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/feature_ist_view_destinations.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/feature_list_icon.dart';

class EntertainmentViewBody extends StatelessWidget {
  const EntertainmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 26, bottom: 44),
                    child: CustomImageHome(),
                  ),
                  FeatureListIcon(),
                  CustomRowText(
                    textblack: "Top Destinations",
                  ),
                  ListViewDestinations(),
                  CustomRowText(
                    textblack: "Top Hotels",
                  ),
                  ListViewDestinations(),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
