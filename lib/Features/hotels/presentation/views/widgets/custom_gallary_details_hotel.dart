import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/gallery_details_hotel_cubit/gallery_details_hotel_cubit.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_snak_bar.dart';

class CustomGallaryDetailsHotel extends StatefulWidget {
  const CustomGallaryDetailsHotel({super.key});

  @override
  State<CustomGallaryDetailsHotel> createState() =>
      _CustomGallaryDetailsHotelState();
}

class _CustomGallaryDetailsHotelState extends State<CustomGallaryDetailsHotel> {
  late String selectedImage = ''; // تهيئة المتغير بـ قيمة افتراضية.

  String getBackupUrl(String url) {
    return url.replaceFirst(EndPoint.baseImageUrl, EndPoint.baseImageDash);
  }

  @override
  void initState() {
    super.initState();

    // تحميل صور الجاليري
    context.read<GalleryDetailsHotelCubit>().fetchGalleryimagedetailshotel(
        idhotel: CacheHelper().getData(key: Constants.idhotel).toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryDetailsHotelCubit, GalleryDetailsHotelState>(
      builder: (context, state) {
        if (state is GalleryDetailsHoteloading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GalleryDetailsHotelFailure) {
          CustomSnackBar.show(context, state.errmessage);
          return const Center(
            child: Text(
              "No data",
              style: Styles.textStyle22,
            ),
          );
        } else if (state is GalleryDetailsHotelSucess) {
          final images = state.gallarydetailshotel
              .map((e) => "${EndPoint.baseImageUrl}${e.mediaUrl}")
              .toList();

          if (selectedImage.isEmpty && images.isNotEmpty) {
            selectedImage = images[0]; // تهيئة الصورة المحددة بأول صورة.
          }

          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  child: AspectRatio(
                    aspectRatio: 17 / 7,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.network(
                        selectedImage,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          // لو حصل خطأ في تحميل الصورة الأصلية جرب الصورة البديلة
                          String backupUrl = getBackupUrl(selectedImage);
                          return Image.network(
                            backupUrl,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              // لو كمان الصورة البديلة وقعت اعرض صورة placeholder محلية
                              return Image.asset(
                                'assets/images/activity_trip.jpg',
                                fit: BoxFit.fill,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 85,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImage = images[index];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

/**
 * import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/gallery_details_hotel_cubit/gallery_details_hotel_cubit.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_snak_bar.dart';

class CustomGallaryDetailsHotel extends StatefulWidget {
  const CustomGallaryDetailsHotel({super.key});

  @override
  State<CustomGallaryDetailsHotel> createState() =>
      _CustomGallaryDetailsHotelState();
}

class _CustomGallaryDetailsHotelState extends State<CustomGallaryDetailsHotel> {
  late String selectedImage = ''; // تهيئة المتغير بـ قيمة افتراضية.

  @override
  void initState() {
    super.initState();

    // اول صورة الافتراضية
    context.read<GalleryDetailsHotelCubit>().fetchGalleryimagedetailshotel(
        idhotel: CacheHelper().getData(key: Constants.idhotel).toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryDetailsHotelCubit, GalleryDetailsHotelState>(
      builder: (context, state) {
        if (state is GalleryDetailsHoteloading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GalleryDetailsHotelFailure) {
          CustomSnackBar.show(context, state.errmessage);
          return const Center(
            child: Text(
              "No data",
              style: Styles.textStyle22,
            ),
          );
        } else if (state is GalleryDetailsHotelSucess) {
          final images = state.gallarydetailshotel
              .map((e) => "${EndPoint.baseImageUrl}${e.mediaUrl}")
              .toList();
          if (selectedImage.isEmpty && images.isNotEmpty) {
            selectedImage = images[0]; // تهيئة selectedImage بأول صورة.
          }
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  child: AspectRatio(
                    aspectRatio: 17 / 7,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(selectedImage),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 85,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImage = images[index];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
 */
