import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sntegpito/Features/profile/presentation/manager/get%20cubit/get_cubit.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_cubit.dart';
import 'package:sntegpito/Features/splash/presentation/views/splash_view.dart';
import 'package:sntegpito/core/api/dio_consumer.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
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
