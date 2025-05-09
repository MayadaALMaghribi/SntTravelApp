import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Destionations/presentation/manager/activities_for_all_city_cubit/activites_for_all_city_cubit.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_card_activity_city.dart';

class ListViewTabBarActivity extends StatelessWidget {
  const ListViewTabBarActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitesForAllCityCubit, ActivitesForAllCityCubitState>(
      builder: (context, state) {
        if (state is ActivitesForAllCityCubitSucess) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              itemCount: state.activitesforcitiesModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 4, right: 12, left: 12),
                  child: CustomCardActivityCity(
                    activitesforcitiesModel:
                        state.activitesforcitiesModel[index],
                  ),
                );
              },
            ),
          );
        } else if (state is ActivitesForAllCityCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errmessage)),
          );
          return Text(state.errmessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
