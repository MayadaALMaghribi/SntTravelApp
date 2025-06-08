import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/splash/presentation/manager/cubit/verifyauthrization_cubit.dart';
import 'package:sntegpito/Features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:sntegpito/core/api/dio_consumer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyauthrizationCubit(DioConsumer(dio: Dio())),
      child: const SplashViewBody(),
    );
  }
}
