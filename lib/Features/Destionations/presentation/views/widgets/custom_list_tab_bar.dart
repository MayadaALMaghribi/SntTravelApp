import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/list_view_tab_bar_activity.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/list_view_tab_bar_hotel.dart';

class CustomListTabBar extends StatelessWidget {
  const CustomListTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      child: TabBarView(
        children: [
          ListViewTabBarHotel(),
          Center(
            child: Text(
              "Favorites Page",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListViewTabBarActivity(),
        ],
      ),
    );
  }
}
