import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Home/presentation/manager/cubit/tourism_type_cubit.dart';
import 'package:sntegpito/Features/Home/presentation/manager/cubit/tourism_type_state.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/custom_card_column.dart';

class CategoriesCol extends StatelessWidget {
  const CategoriesCol({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourismTypeCubit, TourismTypeState>(
      builder: (context, state) {
        if (state is TourismTypeLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is TourismTypeFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text("Error: ${state.errmessage}")),
          );
        } else if (state is TourismTypeSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                //CacheHelper().saveData(key: "tourismTypeId", value: index);
                return CustomCardColumn(tourismType: state.tourismTypes[index]);
              },
              childCount: state.tourismTypes.length,
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
