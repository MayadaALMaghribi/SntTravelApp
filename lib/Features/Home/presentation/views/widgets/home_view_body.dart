import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/categories_col.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/categories_row.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/curve_painter.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/custom_home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  // final List<String> category = [
  //   "Best places",
  //   "Most Visited",
  //   "Favourites",
  //   "New Added",
  //   "Hotels",
  //   "Restaurants"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: CustomHomeAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          child: CustomScrollView(
            slivers: [
              // النصوص والمنحنى
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none, // لضمان ظهور المنحنى
                      children: [
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              height: 1.5,
                            ),
                            children: [
                              TextSpan(text: "Explore the\n"),
                              TextSpan(
                                text: "Beautiful ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              TextSpan(
                                text: "Egypt!",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ).animate().fade(duration: 600.ms, delay: 300.ms),
                        // المنحنى أسفل كلمة "Egypt"
                        Positioned(
                          bottom: -8, // تحديد المسافة العمودية أسفل النص
                          left: 140, // تحديد مكان المنحنى أسفل كلمة Egypt
                          child: CustomPaint(
                            size: const Size(60, 10), // حجم الرسمة
                            painter: CurvePainter(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: CategoriesRow()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const CategoriesCol(),
            ],
          ),
        ),
      ),
    );
  }
}
