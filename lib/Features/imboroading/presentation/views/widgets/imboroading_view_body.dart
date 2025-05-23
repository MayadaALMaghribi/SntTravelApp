import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/home_bottom_bar.dart';
import 'package:sntegpito/Features/imboroading/presentation/views/widgets/screen_view_one.dart';
import 'package:sntegpito/Features/imboroading/presentation/views/widgets/screen_view_three.dart';
import 'package:sntegpito/Features/imboroading/presentation/views/widgets/secreen_view_two.dart';

import '../../../../../constants.dart';
import '../../../../welcome_screen/presentation/views/welcome_view.dart';

class ImboroadingViewBody extends StatefulWidget {
  const ImboroadingViewBody({super.key});

  @override
  State<ImboroadingViewBody> createState() => _ImboroadingViewBodyState();
}

class _ImboroadingViewBodyState extends State<ImboroadingViewBody> {
  PageController pageController = PageController();

  String butttext = "Next";
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              currentPage = value;
              if (value == 2) {
                butttext = "Finish";
              } else {
                butttext = "Next";
              }
              setState(() {});
            },
            children: [
              ScreenViewOne(), // 0
              SecreenViewTwo(), // 1
              ScreenViewThree(), // 2
            ],
          ),
          Positioned(
            bottom: width(context) * 0.09,
            left: width(context) * 0.09,
            right: width(context) * 0.09,
            child: Row(
              children: [
                // SmoothPageIndicator في النص
                Expanded(
                  child: Center(
                    child: SmoothPageIndicator(
                      effect: const ScrollingDotsEffect(
                        activeDotColor: Colors.white,
                        dotHeight: 10, // ارتفاع النقاط
                        dotWidth: 10, // عرض النقاط
                        spacing: 8,
                      ),
                      controller: pageController,
                      count: 3,
                    ),
                  ),
                ),
                // الكلمة على اليمين
                GestureDetector(
                  onTap: () {
                    if (butttext == "Finish") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const WelcomeView(); //WelcomeView
                      }));
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Text(
                    butttext,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
