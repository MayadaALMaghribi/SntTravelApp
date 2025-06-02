import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/home_bottom_bar.dart';
import 'package:sntegpito/Features/imboroading/presentation/views/imboroading_view.dart';
import 'package:sntegpito/Features/welcome_screen/presentation/views/welcome_view.dart';
import 'package:sntegpito/core/utils/constant.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/cache/cache_helper.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  @override
  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Scale animation
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start animation
    _controller.forward();

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (CacheHelper().getData(key: ApiKey.token) != null) {
        log(CacheHelper().getData(key: Constants.isLogin).toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const HomeBottomBar()), // page after splashهنا هتحطي اول صفحة اللي هي ال umborading بعد ما يخلص ال splash يروح عليها
        );
      } else if (CacheHelper().getData(key: ApiKey.token) == null) {
        log(CacheHelper().getData(key: Constants.isLogin).toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const WelcomeView()), // page after splashهنا هتحطي اول صفحة اللي هي ال umborading بعد ما يخلص ال splash يروح عليها
        );
      } else {
        log(CacheHelper().getData(key: Constants.isLogin).toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const ImboroadingView()), // page after splashهنا هتحطي اول صفحة اللي هي ال umborading بعد ما يخلص ال splash يروح عليها
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                "assets/images/Splash.png",
                width: 250,
                height: 250,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
