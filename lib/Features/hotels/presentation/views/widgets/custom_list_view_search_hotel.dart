import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/filter/presentation/views/filter_view.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/search_hotel_by_name_cubit/search_hotel_by_name_cubit.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_card_hotel.dart';
import 'package:sntegpito/Features/filter/presentation/manager/filter_by_date_and_gests/hotel_filter_cubit.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_function_search_hotel.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/utils/constant.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';
import '../../../../../core/utils/styles.dart';

class CustomListViewSearchHotel extends StatefulWidget {
  final GlobalKey<CustomFunctionSearchHotelState> searchFieldKey;
  const CustomListViewSearchHotel({super.key, required this.searchFieldKey});

  @override
  State<CustomListViewSearchHotel> createState() =>
      _CustomListViewSearchHotelState();
}

class _CustomListViewSearchHotelState extends State<CustomListViewSearchHotel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchHotelByNameCubit, SearchHotelByNameState>(
      builder: (context, searchState) {
        return BlocBuilder<HotelFilterCubit, HotelFilterState>(
          builder: (context, filterState) {
            if (searchState is SearchHotelByNameLoading ||
                filterState is HotelFilterLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (searchState is SearchHotelByNameFailure) {
              return _buildErrorWidget(searchState.errmessage);
            } else if (filterState is HotelFilterFailure) {
              if (CacheHelper().getData(key: Constants.cityName) == null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  widget.searchFieldKey.currentState?.showError();
                });
                return _buildErrorWidget("Please Enter Name of Hotel or city");
              } else if (CacheHelper().getData(key: Constants.verify_filter) ==
                  false) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: "Close Filters",
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const FilterView();
                    },
                  );
                  CustomSnackBar.show(context, "must apply filter",
                      isError: true);
                });
              }
              return _buildErrorWidget(filterState.message);
            } else if (filterState is HotelFilterSuccess) {
              final hotelfilter = filterState.hotelFilter;
              if (hotelfilter.isEmpty) {
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
                            searchHotelByNameModel: hotelfilter[index],
                          );
                        },
                        childCount: hotelfilter.length,
                      ),
                    ),
                  ],
                ),
              );
            } else if (searchState is SearchHotelByNameSucess) {
              final hotels = searchState.searchHotelByNameModel;

              if (hotels.isEmpty) {
                return _buildErrorWidget("No Hotels exist");
              }
              if (CacheHelper().getData(key: Constants.verify_filter) != true) {
                return _buildErrorWidget("Please Apply filter");
              }
              context.read<HotelFilterCubit>().filterHotelsByDate();
              log("from hotel search");
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
            } else {
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
