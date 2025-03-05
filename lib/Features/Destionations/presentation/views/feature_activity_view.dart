// import 'package:flutter/material.dart';
// import 'package:sntegpito/Features/Destionations/presentation/views/widgets/feature_activity_view_body.dart';
// import 'package:sntegpito/Features/entertainment/data/models/top_destinations_model.dart';

// class FeatureActivityView extends StatelessWidget {
//   const FeatureActivityView({super.key, required this.topDestinationModel});
//   final TopDestinationModel topDestinationModel;
//   @override
//   Widget build(BuildContext context) {
//     return const FeatureActivityViewBody();
//   }
// }
import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_image_city.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/feature_tab_bar_view_body.dart';
import 'package:sntegpito/Features/entertainment/data/models/top_destinations_model.dart';

class FeatureActivityViewBody extends StatelessWidget {
  const FeatureActivityViewBody({super.key, required this.topDestinationModel});
  final TopDestinationModel topDestinationModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            CustomeImageCity(
              imageUrl:
                  "http://tourism.runasp.net/${topDestinationModel.imageUrl!}",
              nameCity: topDestinationModel.name!,
            ),
            const FeatureTabBarViewBody(),
          ],
        ),
      ),
    );
  }
}
