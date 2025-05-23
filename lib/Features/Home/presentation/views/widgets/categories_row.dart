import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/details_page.dart';

class CategoriesRow extends StatelessWidget {
  CategoriesRow({super.key});

  // قائمة الصور المحلية
  final List<String> imageList = [
    'assets/images_home/downtown.jpg',
    'assets/images_home/korba.jpg',
    'assets/images_home/pic2.jpg',
    'assets/images_home/sea.jpg',
    'assets/images_home/div.jpg',
    'assets/images_home/laxuor.jpeg',
    'assets/images_home/korba.jpg',
    'assets/images_home/medical2.jpg',
    'assets/images_home/medical1.jpg',
    'assets/images_home/cairo1.jpg',
    'assets/images_home/cairo2.jpg',
  ];

  final List<Widget> pagesList = [
    const DetailsPage(
      index: 0,
      title: "Diving Activities",
      description: "Explore the wonders of the underwater world!",
      imagePath: 'assets/images_home/diving.jpg',
      city: "Hurghada",
    ),
    const DetailsPage(
      index: 1,
      title: "Sharm el-Sheikh",
      description: "Relax and enjoy the beautiful beaches.",
      imagePath: 'assets/images_home/beach.jpeg',
      city: "Sharm el-Sheikh",
    ),
    const DetailsPage(
      index: 2,
      title: "Pyramids",
      description: "Discover the ancient mysteries of the pyramids.",
      imagePath: 'assets/images_home/pyramids.jpg',
      city: "Giza",
    ),
    const DetailsPage(
      index: 3,
      title: "Luxor",
      description: "Visit the historic temples of Luxor.",
      imagePath: 'assets/images_home/laxuor.jpeg',
      city: "Luxor",
    ),
    const DetailsPage(
      index: 4,
      title: "Aswan",
      description:
          "Experience the beauty and tranquility of Aswan, a city known for its stunning Nile views, ancient temples, and the famous Abu Simbel temples.",
      imagePath: 'assets/images_home/Aswan.jpg',
      city: "Aswan",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return carousel_slider.CarouselSlider(
      options: carousel_slider.CarouselOptions(
        height: 200.0, // ارتفاع الكاروسيل
        autoPlay: true, // تشغيل تلقائي للحركة
        autoPlayInterval: const Duration(seconds: 2), // مدة بقاء كل صورة
        enlargeCenterPage: true, // تكبير الصورة في المنتصف
        enableInfiniteScroll: true, // استمرار الحركة بلا نهاية
        viewportFraction: 0.5, // نسبة حجم الصورة بالنسبة للشاشة
      ),
      // عرض الصور من الـ assets
      items: imageList
          .asMap()
          .entries
          .map((entry) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => pagesList[entry.key]));
                },
                child: Hero(
                  tag: entry.value,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(entry.value), // استخدام AssetImage
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
