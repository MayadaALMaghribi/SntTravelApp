import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/search_hotel_by_name_cubit/search_hotel_by_name_cubit.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_card_hotel.dart';
import 'package:sntegpito/Features/filter/presentation/manager/filter_by_date_and_gests/hotel_filter_cubit.dart';

import '../../../../../core/utils/styles.dart';

class CustomListViewSearchHotel extends StatelessWidget {
  const CustomListViewSearchHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchHotelByNameCubit, SearchHotelByNameState>(
      builder: (context, searchState) {
        return BlocBuilder<HotelFilterCubit, HotelFilterState>(
          builder: (context, filterState) {
            // لو أي واحد منهم في حالة loading
            if (searchState is SearchHotelByNameLoading ||
                filterState is HotelFilterLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // لو فيه Error في السيرش
            else if (searchState is SearchHotelByNameFailure) {
              return _buildErrorWidget(searchState.errmessage);
            }

            // لو فيه Error في الفلتر (لو انتي بتعملي كده)
            else if (filterState is HotelFilterFailure) {
              return _buildErrorWidget(filterState.message);
            }

            // لو السيرش نجح وفلتر شغال أو مش مفعّل
            else if (searchState is SearchHotelByNameSucess) {
              final hotels = searchState.searchHotelByNameModel;

              if (hotels.isEmpty) {
                return _buildErrorWidget("No Hotels exist");
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CustomCardHotel(
                            searchHotelByNameModel: hotels[index],
                          );
                        },
                        childCount: hotels.length,
                      ),
                    ),
                  ],
                ),
              );
            }

            // الحالة الافتراضية
            else {
              return _buildErrorWidget(
                  "Let's get started!\nSearch for a hotel name to see our best deals");
            }
          },
        );
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
