// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sntegpito/Features/Destionations/data/models/activites_for_cities_model.dart';
// import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_card_activity_image_.dart';
// import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_guest_counter.dart';
// import 'package:sntegpito/Features/Destionations/presentation/views/widgets/rating_test.dart';
// import 'package:sntegpito/Features/favourite/presentation/manager/addfovuritecubit/addfovurite_cubit.dart';
// import 'package:sntegpito/core/api/end_ponits.dart';
// import 'package:sntegpito/core/utils/styles.dart';
// import 'package:sntegpito/core/widgets/custom_function_favourite.dart';
// import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

// class CustomCardActivityCity extends StatefulWidget {
//   const CustomCardActivityCity(
//       {super.key, required this.activitesforcitiesModel});

//   final ActivitesforcitiesModel activitesforcitiesModel;

//   @override
//   State<CustomCardActivityCity> createState() => _CustomCardActivityCityState();
// }

// class _CustomCardActivityCityState extends State<CustomCardActivityCity> {
//   late TextEditingController _guestsController;

//   @override
//   void initState() {
//     super.initState();
//     _guestsController = TextEditingController(text: "1");
//   }

//   @override
//   void dispose() {
//     _guestsController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AddfovuriteCubit, AddfovuriteState>(
//       listener: (context, state) {
//         if (state is AddfovuriteSucess) {
//           CustomSnackBar.show(context, state.sucessmessage);
//         } else if (state is RemovefavSucess) {
//           CustomSnackBar.show(context, state.errorModel.errorMessage);
//         } else if (state is RemovefavFailure || state is AddfovuriteFailure) {
//           CustomSnackBar.show(
//             context,
//             (state is AddfovuriteFailure)
//                 ? state.errmessage
//                 : (state as RemovefavFailure).errorModel.errorMessage,
//             isError: true,
//           );
//         }
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
//         child: Container(
//           width: 350,
//           height: 350,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: const Color(0xff868686), width: 1),
//           ),
//           child: Column(
//             children: [
//               //final guests = int.tryParse(_guestsController.text) ?? 1;
//               CustomCardActivityImage(
//                 numOfGuests: int.tryParse(_guestsController.text) ?? 1,
//                 imageUrl:
//                     "${EndPoint.baseImageUrl}${widget.activitesforcitiesModel.imageUrl!}",
//                 activityId: widget.activitesforcitiesModel.id!,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 8, left: 12, right: 12, bottom: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(widget.activitesforcitiesModel.name!,
//                         style: Styles.textStyle17.copyWith(fontSize: 20)),
//                     Text(widget.activitesforcitiesModel.price!.toString(),
//                         style: Styles.textStyle14),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8),
//                 child: Text(
//                   widget.activitesforcitiesModel.description!,
//                   style: Styles.textStyle12,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8, right: 8, top: 6),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const RatingTest(),
//                     CustomFunctionFavourite(
//                       indexIdFav: widget.activitesforcitiesModel.id!,
//                       itemTypefav: Constants.itemTypefav,
//                       userIdfav: Constants.userid,
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, bottom: 8),
//                 child: CustomGuestCounter(
//                   label: "Guests",
//                   textEditingController: _guestsController,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Destionations/data/models/activites_for_cities_model.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_card_activity_image_.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_guest_counter.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/rating_test.dart';
import 'package:sntegpito/Features/favourite/presentation/manager/addfovuritecubit/addfovurite_cubit.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/widgets/custom_function_favourite.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

class CustomCardActivityCity extends StatefulWidget {
  const CustomCardActivityCity(
      {super.key, required this.activitesforcitiesModel});

  final ActivitesforcitiesModel activitesforcitiesModel;

  @override
  State<CustomCardActivityCity> createState() => _CustomCardActivityCityState();
}

// class _CustomCardActivityCityState extends State<CustomCardActivityCity> {
//   late TextEditingController _guestsController;

//   @override
//   void initState() {
//     super.initState();
//     _guestsController = TextEditingController(text: "1");
//   }

//   @override
//   void dispose() {
//     _guestsController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AddfovuriteCubit, AddfovuriteState>(
//       listener: (context, state) {
//         if (state is AddfovuriteSucess) {
//           CustomSnackBar.show(context, state.sucessmessage);
//         } else if (state is RemovefavSucess) {
//           CustomSnackBar.show(context, state.errorModel.errorMessage);
//         } else if (state is RemovefavFailure || state is AddfovuriteFailure) {
//           CustomSnackBar.show(
//             context,
//             (state is AddfovuriteFailure)
//                 ? state.errmessage
//                 : (state as RemovefavFailure).errorModel.errorMessage,
//             isError: true,
//           );
//         }
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
//         child: Container(
//           width: 350,
//           height: 350,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: const Color(0xff868686), width: 1),
//           ),
//           child: Column(
//             children: [
//               CustomCardActivityImage(
//                 numOfGuests: int.tryParse(_guestsController.text) ?? 1,
//                 imageUrl:
//                     "${EndPoint.baseImageUrl}${widget.activitesforcitiesModel.imageUrl!}",
//                 activityId: widget.activitesforcitiesModel.id!,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 8, left: 12, right: 12, bottom: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(widget.activitesforcitiesModel.name!),
//                     Text(widget.activitesforcitiesModel.price!.toString()),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8),
//                 child: Text(
//                   widget.activitesforcitiesModel.description!,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8, right: 8, top: 6),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const RatingTest(),
//                     CustomFunctionFavourite(
//                       indexIdFav: widget.activitesforcitiesModel.id!,
//                       itemTypefav: Constants.itemTypefav,
//                       userIdfav: Constants.userid,
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, bottom: 8),
//                 child: CustomGuestCounter(
//                   label: "Guests",
//                   textEditingController: _guestsController,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class _CustomCardActivityCityState extends State<CustomCardActivityCity> {
  late TextEditingController _guestsController;

  @override
  void initState() {
    super.initState();
    _guestsController = TextEditingController(text: "1");
  }

  @override
  void dispose() {
    _guestsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddfovuriteCubit, AddfovuriteState>(
      listener: (context, state) {
        if (state is AddfovuriteSucess) {
          CustomSnackBar.show(context, state.sucessmessage);
        } else if (state is RemovefavSucess) {
          CustomSnackBar.show(context, state.errorModel.errorMessage);
        } else if (state is RemovefavFailure || state is AddfovuriteFailure) {
          CustomSnackBar.show(
            context,
            (state is AddfovuriteFailure)
                ? state.errmessage
                : (state as RemovefavFailure).errorModel.errorMessage,
            isError: true,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xff868686), width: 1),
          ),
          child: Column(
            children: [
              CustomCardActivityImage(
                numOfGuests: int.tryParse(_guestsController.text) ?? 1,
                imageUrl:
                    "${EndPoint.baseImageUrl}${widget.activitesforcitiesModel.imageUrl!}",
                activityId: widget.activitesforcitiesModel.id!,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 12, right: 12, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.activitesforcitiesModel.name!),
                    Text(widget.activitesforcitiesModel.price!.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.activitesforcitiesModel.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RatingTest(),
                    CustomFunctionFavourite(
                      indexIdFav: widget.activitesforcitiesModel.id!,
                      itemTypefav: Constants.itemTypefav,
                      userIdfav: Constants.userid,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: CustomGuestCounter(
                  label: "Guests",
                  textEditingController: _guestsController,
                  onValueChanged: (newValue) {
                    // Update the numOfGuests value in the parent widget
                    setState(() {
                      // Update the controller value to the new value
                      _guestsController.text = newValue.toString();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
