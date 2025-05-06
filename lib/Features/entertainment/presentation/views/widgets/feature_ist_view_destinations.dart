import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/entertainment/presentation/manager/top_destinations_cubit/top_destinations_cubit.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/feature_card_destinations.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

import '../../../../Destionations/presentation/views/feature_activity_view.dart';

class ListViewDestinations extends StatelessWidget {
  const ListViewDestinations({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopDestinationsCubit, TopDestinationsState>(
      builder: (context, state) {
        if (state is TopDestinationsSucess) {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.topDestinationModel.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeatureActivityViewBody(
                          topDestinationModel: state.topDestinationModel[index],
                        ),
                      ),
                    );
                    CacheHelper().saveData(
                        key: "ID_Cached_City_Destination",
                        value: state.topDestinationModel[index].id);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 10, bottom: 2),
                    child: FeatureCardDestinations(
                      topDestinationModel: state.topDestinationModel[index],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is TopDestinationsFailure) {
          return Center(child: Text("Error: ${state.errmessage}"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
