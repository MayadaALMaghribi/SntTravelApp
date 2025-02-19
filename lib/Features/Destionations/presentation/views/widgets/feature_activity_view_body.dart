import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_image_city.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_tab_bar_view_body.dart';

class FeatureActivityViewBody extends StatelessWidget {
  const FeatureActivityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            CustomeImageCity(),
            CustomTabBarViewBody(),
          ],
        ),
      ),
    );
  }
}
