import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/home_bottom_bar.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/custom_row_text.dart';
import 'package:sntegpito/Features/medical/presentation/manager/medical_cubit/medical_cubit.dart';
import 'package:sntegpito/Features/medical/presentation/manager/medical_cubit/medical_state.dart';
import 'package:sntegpito/Features/medical/presentation/views/widgets/custom_image_medical_top.dart';
import 'package:sntegpito/Features/medical/presentation/views/widgets/feature_ist_view_destinations_medical.dart';
import 'package:sntegpito/Features/medical/presentation/views/widgets/feature_list_icon_medical.dart';
import 'package:sntegpito/core/widgets/custom_app_bar.dart';

class MedicalViewBody extends StatelessWidget {
  const MedicalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppBar(
            text: "",
            page: HomeBottomBar(),
          ),
        ),
        backgroundColor: const Color(0xffFFFFFF),
        body: BlocBuilder<MedicalCubit, MedicalState>(
          builder: (context, state) {
            if (state is MedicalImageDiscountLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MedicalImageDiscountFailure) {
              return Center(child: Text("Error: ${state.errmessage}"));
            } else if (state is MedicalImageDiscountSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 26, bottom: 44),
                      child:
                          CustomImageMedicalTop(imagemodel: state.imagemodel),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: FeatureListIconMedical(),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: CustomRowText(textblack: "Top Destinations"),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: ListViewDestinationsMedical(),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: CustomRowText(textblack: "Top Hotels"),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: ListViewDestinationsMedical(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 20),
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
