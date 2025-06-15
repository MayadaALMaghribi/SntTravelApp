import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/get_activity_for_booking/get_activity_for_booking_cubit.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/get_all_activity_cart/get_all_activity_cart_cubit.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/prepare_activity_booking/prepare_activity_before_booking_cubit.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/views/trip_planner_view.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/views/widgets/custom_card_activity_booked.dart';
import 'package:sntegpito/core/widgets/custom_room_button.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';
import '../../../../../core/utils/constant.dart';

class BookingActivityViewBody extends StatelessWidget {
  const BookingActivityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllActivityCartCubit, GetAllActivityCartState>(
      builder: (context, state) {
        if (state is GetAllActivityCartLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetAllActivityCartFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomSnackBar.show(context, state.errmessage);
          });
        } else if (state is GetAllActivityCartSuccess) {
          final int price = state.allactivitycartmodel.first.totalPrice ?? 0;
          final activities = state.allactivitycartmodel.first.data ?? [];
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "Booking Activity",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: activities.length,
                    (context, index) {
                      return CustomCardActivityBooked(
                        data: activities[index],
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Price:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${state.allactivitycartmodel.first.totalPrice} EGP",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        BlocListener<PrepareActivityBeforeBookingCubit,
                            PrepareActivityBeforeBookingState>(
                          listener: (context, state) {
                            if (state is PrepareActivityBeforeBookingLoading) {
                              Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state
                                is PrepareActivityBeforeBookingFailure) {
                              CustomSnackBar.show(context, state.errmessage,
                                  isError: true);
                            } else if (state
                                is PrepareActivityBeforeBookingSuccess) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TripPlannerView(
                                    prepareActivityBookingModel:
                                        state.prepareActivityBookingModel,
                                    price: price,
                                  ),
                                ),
                              );
                              context
                                  .read<GetActivityForBookingCubit>()
                                  .getActivityBooking(
                                      userid: CacheHelper()
                                          .getData(key: Constants.userId));
                            }
                          },
                          child: CustomRoomButton(
                            text: "Book Now",
                            ontap: () {
                              context
                                  .read<PrepareActivityBeforeBookingCubit>()
                                  .prepare(
                                      userId: CacheHelper()
                                          .getData(key: Constants.userId));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return InitalWidgets();
      },
    );
  }
}

class InitalWidgets extends StatelessWidget {
  const InitalWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images_home/cart.png",
            width: 350,
            height: 450,
          ),
          const SizedBox(height: 10),
          const Text(
            "You don't have any",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "Activities",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "The Cart Is Empty",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
