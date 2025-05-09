import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/get_all_activity_cart/get_all_activity_cart_cubit.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/views/widgets/custom_card_activity_booked.dart';
import 'package:sntegpito/core/utils/styles.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

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
                Text(
                  "Total Price :",
                  style: Styles.textStyle15
                      .copyWith(color: Colors.black.withOpacity(0.7)),
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
    return Column(
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
          textAlign: TextAlign.center, // توسيط النص داخل Text widget
        ),
        const SizedBox(height: 10),
        const Text(
          "Activities",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, // توسيط النص داخل Text widget
        ),
        const SizedBox(height: 10),
        const Text(
          "The Cart Is Empty",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center, // توسيط النص داخل Text widget
        ),
      ],
    );
  }
}
