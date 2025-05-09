import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/add_cart/cart_cubit.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/get_all_activity_cart/get_all_activity_cart_cubit.dart';
import 'package:sntegpito/Features/Home/presentation/manager/cubit/tourism_type_cubit.dart';
import 'package:sntegpito/Features/entertainment/presentation/manager/entertainment_cubit/entertainment_cubit.dart';
import 'package:sntegpito/Features/entertainment/presentation/manager/top_destinations_cubit/top_destinations_cubit.dart';
import 'package:sntegpito/Features/favourite/presentation/manager/addfovuritecubit/addfovurite_cubit.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/gallery_details_hotel_cubit/gallery_details_hotel_cubit.dart';
import 'package:sntegpito/Features/payment/presentation/manager/paymob_cubit/paymob_payment_cubit.dart';
import 'package:sntegpito/Features/room/presentation/manager/room_cubit/roomshotel_cubit.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/search_hotel_by_name_cubit/search_hotel_by_name_cubit.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/services_hotel_details_cubit/services_hotel_details_cubit.dart';
import 'package:sntegpito/Features/medical/presentation/manager/medical_cubit/medical_cubit.dart';
import 'package:sntegpito/Features/payment/presentation/manager/booking_room/booking_room_cubit.dart';
import 'package:sntegpito/Features/payment/presentation/manager/confirm_payment_cubit/confirm_payment_cubit.dart';
import 'package:sntegpito/Features/payment/presentation/manager/get_details_booking_before_pay/get_details_booking_before_payment_cubit.dart';
import 'package:sntegpito/Features/profile/presentation/manager/get%20cubit/get_cubit.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_cubit.dart';
import 'package:sntegpito/Features/splash/presentation/views/splash_view.dart';
import 'package:sntegpito/core/api/dio_consumer.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/Features/filter/presentation/manager/filter_by_date_and_gests/hotel_filter_cubit.dart';

import 'core/api/end_ponits.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();

  final hotelId = CacheHelper().getData(key: Constants.idhotel);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => UserCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => ProfileCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) =>
            GetCubit(DioConsumer(dio: Dio()))..getuserprofile(),
      ),
      BlocProvider(
        create: (context) =>
            TourismTypeCubit(DioConsumer(dio: Dio()))..getTourismType(),
      ),
      BlocProvider(
        create: (context) =>
            EntertainmentCubit(DioConsumer(dio: Dio()))..getImageDiscount(),
      ),
      BlocProvider(
        create: (context) =>
            MedicalCubit(DioConsumer(dio: Dio()))..getImageDiscounttop(),
      ),
      BlocProvider(
        create: (context) => TopDestinationsCubit(DioConsumer(dio: Dio()))
          ..fetchTopDestinations(),
      ),
      BlocProvider(
        create: (context) => SearchHotelByNameCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => RoomsHotelCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => HotelFilterCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => AddfovuriteCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => GalleryDetailsHotelCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) {
          final cubit = ServicesHotelDetailsCubit(DioConsumer(dio: Dio()));
          if (hotelId != null) {
            cubit.fetchserviceshotelDetails(hotelid: hotelId.toString());
          }
          return cubit;
        },
      ),
      BlocProvider(
        create: (context) => BookingRoomCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) =>
            GetDetailsBookingBeforePaymentCubit(DioConsumer(dio: Dio()))
              ..getDetailsBooking(),
      ),
      BlocProvider(
        create: (context) => ConfirmPaymentCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => PaymobPaymentCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => CartCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => GetAllActivityCartCubit(DioConsumer(dio: Dio()))
          ..fetchAllActivityCart(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: //const Color(0xFFEDF2F6),
              Colors.white),
      home: const SplashView(),
    );
  }
}
