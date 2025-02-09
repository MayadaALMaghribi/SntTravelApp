import 'package:flutter/material.dart';
import 'package:sntegpito/Features/imboroading/data/models/boroading_model.dart';
import 'package:sntegpito/Features/imboroading/presentation/views/widgets/custom_boroading.dart';
import 'package:sntegpito/core/utils/assests.dart';

class ScreenViewThree extends StatelessWidget {
  ScreenViewThree({super.key});
  final BoroadingModel item = BoroadingModel(
    image: AssetsData.egypt,
    titleBold: "EXPLORE",
    subtitle: "Visit and see the oldest and most beautiful \n places on earth",
    title: "THE EGYPYT",
    title_up: "LET'S",
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBoroading(
          items: item,
        ),
      ),
    );
  }
}
