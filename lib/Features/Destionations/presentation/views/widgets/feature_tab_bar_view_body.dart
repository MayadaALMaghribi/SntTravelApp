import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_list_tab_bar.dart';

class FeatureTabBarViewBody extends StatefulWidget {
  const FeatureTabBarViewBody({super.key});

  @override
  State<FeatureTabBarViewBody> createState() => _CustomState();
}

class _CustomState extends State<FeatureTabBarViewBody> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Color(0xff247CFF),
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                  icon: Icon(Icons.directions_boat_filled_outlined),
                  text: "Activity"),
              Tab(
                icon: Icon(Icons.directions_car_filled_outlined),
                text: "Cars",
              ),
            ],
          ),
          CustomListTabBar()
        ],
      ),
    );
  }
}
