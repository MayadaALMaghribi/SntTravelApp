import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/list_view_tab_bar_hotel.dart';

class CustomTabBarViewBody extends StatefulWidget {
  const CustomTabBarViewBody({super.key});

  @override
  State<CustomTabBarViewBody> createState() => _CustomState();
}

class _CustomState extends State<CustomTabBarViewBody> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Color(0xff247CFF),
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                icon: Icon(Icons.home_work_sharp),
                text: "Hotels",
              ),
              Tab(
                icon: Icon(Icons.directions_car_filled_outlined),
                text: "Cars",
              ),
              Tab(
                  icon: Icon(Icons.directions_boat_filled_outlined),
                  text: "Activity"),
            ],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              // physics: NeverScrollableScrollPhysics(),
              children: [
                ListViewTabBarHotel(),
                Center(
                  child: Text(
                    "Favorites Page",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(
                    "Profile Page",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
