import 'package:flutter/material.dart';
import 'package:sntegpito/Features/imboroading/data/models/boroading_model.dart';
import 'package:sntegpito/Features/imboroading/presentation/views/widgets/custom_boroading.dart';
import 'package:sntegpito/core/utils/assests.dart';

class ScreenViewOne extends StatelessWidget {
  ScreenViewOne({super.key});
  final BoroadingModel boroadingModel = BoroadingModel(
    image: AssetsData.travel,
    titleBold: "HELP YOU",
    subtitle: "and easy to use for anyone \nfor discover Egypt and enjoing",
    title: "Travel in EGYPT",
    title_up: "APP",
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBoroading(items: boroadingModel),
      ),
    );
  }
}
