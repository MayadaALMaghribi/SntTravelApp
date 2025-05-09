import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/get_all_activity_cart/get_all_activity_cart_cubit.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/views/widgets/custom_card_activity_booked.dart';

class BookingActivityViewBody extends StatelessWidget {
  const BookingActivityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllActivityCartCubit, GetAllActivityCartState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
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
                childCount: 10,
                (context, index) {
                  return const CustomCardActivityBooked();
                },
              ))
            ],
          ),
        );
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
          "assets/images_home/favourite.jpg",
          width: 350,
          height: 350,
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
          "Favourites",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, // توسيط النص داخل Text widget
        ),
        const SizedBox(height: 10),
        const Text(
          "Save what you like for later",
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
