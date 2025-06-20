import 'package:flutter/material.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';

class CustomeImageCity extends StatelessWidget {
  const CustomeImageCity({
    super.key,
    required this.imageUrl,
    required this.nameCity,
  });

  final String imageUrl;
  final String nameCity;

  @override
  Widget build(BuildContext context) {
    final String backupUrl = imageUrl.replaceFirst(
      EndPoint.baseImageUrl,
      EndPoint.baseImageDash,
    );

    return Stack(
      children: [
        SizedBox(
          height: height(context) * 0.37,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(34),
              bottomRight: Radius.circular(34),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  backupUrl,
                  fit: BoxFit.cover,
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
        Positioned(
          top: 21,
          left: 13,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
        Positioned(
          left: 13,
          bottom: 30,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.near_me_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Text(
                nameCity,
                style: Styles.textStyle22.copyWith(fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ],
    );
  }
}

/**
 * import 'package:flutter/material.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';

class CustomeImageCity extends StatelessWidget {
  const CustomeImageCity({
    super.key,
    required this.imageUrl,
    required this.nameCity,
  });
  final String imageUrl;
  final String nameCity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height(context) * 0.37,
          width: double.infinity,
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(34),
                bottomRight: Radius.circular(34),
              ),
              child: Image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.width,
              )),
        ),
        Positioned(
          top: 21,
          left: 13,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
        Positioned(
          left: 13,
          bottom: 30,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.near_me_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Text(
                nameCity,
                style: Styles.textStyle22.copyWith(fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ],
    );
  }
}

 */