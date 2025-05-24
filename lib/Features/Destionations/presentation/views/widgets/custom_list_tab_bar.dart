import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/list_view_tab_bar_activity.dart';
import 'package:sntegpito/core/api/dio_consumer.dart';

import '../../manager/activities_for_all_city_cubit/activites_for_all_city_cubit.dart';

class CustomListTabBar extends StatelessWidget {
  const CustomListTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ActivitesForAllCityCubit(DioConsumer(dio: Dio()))
                  ..fetchAllActivitesForCities()), // مثال لكيوبت للفنادق
        // مثال لكيوبت للأنشطة
      ],
      child: const SizedBox(
        height: 400,
        child: TabBarView(
          children: [
            //ListViewTabBarHotel(),

            ListViewTabBarActivity(),
            Center(
              child: Text(
                "Favorites Page",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
