import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/search_hotel_by_name_cubit/search_hotel_by_name_cubit.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_card_hotel.dart';
import '../../../../../core/utils/styles.dart';

class CustomListViewSearchHotel extends StatelessWidget {
  const CustomListViewSearchHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchHotelByNameCubit, SearchHotelByNameState>(
      builder: (context, state) {
        if (state is SearchHotelByNameLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchHotelByNameFailure) {
          return _buildErrorWidget(state.errmessage);
        } else if (state is SearchHotelByNameSucess) {
          if (state.searchHotelByNameModel.isEmpty) {
            return _buildErrorWidget("No Hotels exist");
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height *
                0.8, // جربي تعديلها حسب الحاجة
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return CustomCardHotel(
                        searchHotelByNameModel:
                            state.searchHotelByNameModel[index],
                      );
                    },
                    childCount: state.searchHotelByNameModel.length,
                  ),
                ),
              ],
            ),
          );
        } else {
          return _buildErrorWidget(
              "Let's get started!\nSearch for a hotel name to see our best deals");
        }
      },
    );
  }

  Widget _buildErrorWidget(String message) {
    return Padding(
      padding: const EdgeInsets.only(top: 170, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset("assets/images/search_hotel.png", width: 250),
          ),
          Text(message, style: Styles.textStyle17, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
