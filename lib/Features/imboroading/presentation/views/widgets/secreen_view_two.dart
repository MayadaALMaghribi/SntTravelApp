import 'package:flutter/material.dart';
import 'package:sntegpito/Features/imboroading/presentation/views/widgets/custom_boroading.dart';

import '../../../../../core/utils/assests.dart';
import '../../../data/models/boroading_model.dart';

class SecreenViewTwo extends StatelessWidget {
  SecreenViewTwo({super.key});
  final BoroadingModel item = BoroadingModel(
    image: AssetsData.hotel,
    titleBold: "CHOOSING",
    subtitle:
        "Stay in the most elegant and expensive \n hotels in Egypt with the best serviced and \n the best price in the world",
    title: "A Suitable Hotel",
    title_up: "HELP IN",
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBoroading(items: item),
      ),
    );
  }
}
