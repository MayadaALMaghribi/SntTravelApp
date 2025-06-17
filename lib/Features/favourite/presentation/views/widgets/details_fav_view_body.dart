import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sntegpito/core/utils/styles.dart';
import '../../../../../core/api/end_ponits.dart';

class DetailsFavViewBody extends StatelessWidget {
  const DetailsFavViewBody(
      {super.key,
      required this.imageUrl,
      required this.Type,
      required this.nameCity,
      required this.name,
      required this.price,
      required this.description,
      required this.moreDescription});
  final String imageUrl;
  final String Type;
  final String nameCity;
  final String name;
  final String price;
  final String description;
  final String moreDescription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details$Type",
            style: Styles.textStyle22.copyWith(color: Colors.black)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
        ).animate().fade(duration: 600.ms, delay: 300.ms),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImagefavDetails(),
              SizedBox(
                height: 10,
              ),
              Text(
                nameCity,
                style: Styles.textStyles24,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: Styles.textstyle18,
                  ),
                  Text(price, style: Styles.textStyle17)
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                description,
                maxLines: 3,
                style: Styles.textStyle20
                    .copyWith(fontSize: 15, color: Colors.black),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "More Details :",
                style: Styles.textStyle20,
              ),
              SizedBox(
                height: 10,
              ),
              Text(moreDescription,
                  style: Styles.textStyle20
                      .copyWith(fontSize: 15, color: Colors.black))
            ],
          ),
        ),
      ),
    );
  }

  SizedBox CustomImagefavDetails() {
    return SizedBox(
      height: 220,
      child: AspectRatio(
        aspectRatio: 17 / 7,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            "${EndPoint.baseImageUrl}{imageUrl}",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                "${EndPoint.baseImageDash}${imageUrl}",
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/placeholder.jpg', // صورة افتراضية
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
