import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/payment/presentation/manager/cancel_booking/cancel_booking_cubit.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/payment_view_body.dart';
import 'package:sntegpito/core/api/dio_consumer.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CancelBookingCubit(DioConsumer(dio: Dio())),
      child: const PaymentViewBody(),
    );
  }
}
