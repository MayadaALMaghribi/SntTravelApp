import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/entertainment/presentation/manager/entertainment_cubit/entertainment_cubit.dart';
import 'package:sntegpito/Features/entertainment/presentation/manager/entertainment_cubit/entertainment_state.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/custom_image_entertainment_top.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/custom_row_text.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/feature_ist_view_destinations.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/feature_list_icon.dart';

class EntertainmentViewBody extends StatelessWidget {
  const EntertainmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xffFFFFFF),
        body: BlocBuilder<EntertainmentCubit, EntertainmentState>(
          builder: (context, state) {
            if (state is ImageDiscountLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ImageDiscountFailure) {
              return Center(child: Text("Error: ${state.errmessage}"));
            } else if (state is ImageDiscountSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: IconButton(
                      alignment: Alignment.topLeft,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 35,
                      ),
                    ).animate().fade(duration: 600.ms, delay: 300.ms),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 20, bottom: 44),
                      child: CustomImageEntertainmentTop(
                          imagemodel: state.imagemodel),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: FeatureListIcon(),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: CustomRowText(textblack: "Top Destinations"),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: ListViewDestinations(),
                  ),
                ],
              );
            }
            return const Center(child: Text('Unknown error occurred.'));
          },
        ),
      ),
    );
  }
}
