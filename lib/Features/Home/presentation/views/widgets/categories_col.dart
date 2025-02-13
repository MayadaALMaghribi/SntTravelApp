import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Home/data/model/category_model.dart';
import 'package:sntegpito/Features/Home/presentation/views/archaeological_tourism.dart';
import 'package:sntegpito/Features/Home/presentation/views/entertainmentTourism.dart';
import 'package:sntegpito/Features/Home/presentation/views/environmental_tourism.dart';
import 'package:sntegpito/Features/Home/presentation/views/medical_tourism.dart';
import 'package:sntegpito/Features/Home/presentation/views/regligious_tourism.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/card_col_list.dart';


class CategoriesCol extends StatelessWidget {
  const CategoriesCol({super.key});
  final List<CategoryModel> categorylistcol = const [
    CategoryModel(
        categoryname: "Entertainment tourism",
        image: "assets/images_home/Entertainment.jpg"),
    CategoryModel(
        categoryname: "Religious tourism",
        image: "assets/images_home/Religious.jpg"),
    CategoryModel(
        categoryname: "Archaeological tourism",
        image: "assets/images_home/Archaeological_tourism.jpg"),
    CategoryModel(
        categoryname: "Environmental tourism",
        image: "assets/images_home/Environmental.jpg"),
    CategoryModel(
        categoryname: "Medical tourism",
        image: "assets/images_home/Medical tourism.jpeg")
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: 5, (context, index) {
      return GestureDetector(
          onTap: () {
            if (index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const EntertainmentTourism();
              }));
            } else if (index == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ReligiousTourism();
              }));
            } else if (index == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ArchaeologicalTourism();
              }));
            } else if (index == 3) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const EnvironmentalTourism();
              }));
            } else if (index == 4) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MedicalTourism();
              }));
            }
          },
          child: CardColList(colmodel: categorylistcol[index]));
    }));
  }
}
