
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:nile_global_school/core/helper/extensions.dart';
// import 'package:nile_global_school/core/helper/payment_keys.dart';
// import 'package:nile_global_school/core/helper/spacing.dart';
// import 'package:nile_global_school/core/theming/colors.dart';
// import 'package:nile_global_school/core/theming/styles.dart';
// import 'package:nile_global_school/core/widgets/custom_elevation_button.dart';
// import 'package:nile_global_school/core/widgets/custom_snack_bar.dart';
// import 'package:nile_global_school/features/student/payment/data/models/payment_pay_request.dart';
// import 'package:nile_global_school/features/student/payment/data/models/payment_responce.dart';
// import 'package:nile_global_school/features/student/payment/data/models/paypal/amount_model/details.dart';
// import 'package:nile_global_school/features/student/payment/data/models/paypal/items_list_model/item.dart';
// import 'package:nile_global_school/features/student/payment/data/models/paypal/items_list_model/items_list_model.dart';
// import 'package:nile_global_school/features/student/payment/logic/paypal_payment/paypal_cubit.dart';

// import '../../../data/models/paypal/amount_model/amount_model.dart';

// class CustomPayListener extends StatelessWidget {
//   const CustomPayListener({super.key, required this.paymentResponce});
//   final PaymentResponce paymentResponce;
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<PaypalCubit, PaypalState>(
//       listenWhen: (previous, current) =>
//           current is PaypalFailure ||
//           current is PaypalLoading ||
//           current is PaypalSuccess,
//       listener: (context, state) {
//         if (state is PaypalSuccess) {
//           log('paybal succcess');
//           context.pop();
//           context.pop();
//           CustomSnackBar.show(
//             context,
//             'Payment successful! Your transaction has been processed securely.',
//           );
//         } else if (state is PaypalFailure) {
//           log("paypal payment error");
//           CustomSnackBar.show(
//             context,
//             'Payment failed. Please check your network or try again later.',
//             isError: true,
//           );
//         } else {
//           log("paypal payment loading");
//         }
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         child: CustomElevationButton(
//           onPressed: () {
//             var paybalTranscationData =
//                 getPaybalTransactionData(paymentResponce);
//             executePaybalPayment(
//                 context, paymentResponce, paybalTranscationData);
//           },
//           bodyOfButton: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Pay with",
//                 style: TextStylesManager.font16WhiteMedium,
//               ),
//               horizontalSpacing(12),
//               Image.asset(
//                 "assets/images/pngs/paypal_logo.png",
//                 width: 18.h,
//                 height: 18.h,
//                 color: ColorsManager.white,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   ({AmountModel amount, ItemsListModel itemsList}) getPaybalTransactionData(
//       PaymentResponce paymentResponce) {
//     final amount = AmountModel(
//       total: paymentResponce.totalFees.toString(),
//       currency: "USD",
//       details: Details(
//         shipping: "0",
//         shippingDiscount: 0,
//         subtotal: paymentResponce.totalFees.toString(),
//       ),
//     );

//     final items = <Item>[
//       Item(
//         currency: "USD",
//         price: paymentResponce.totalFees.toString(),
//         quantity: 1,
//         name: paymentResponce.title,
//       ),
//     ];

//     final itemsList = ItemsListModel(items: items);
//     return (amount: amount, itemsList: itemsList);
//   }

//   void executePaybalPayment(
//     BuildContext context,PaymentResponce paymentResponce,
//     ({AmountModel amount, ItemsListModel itemsList}) paybalTranscationData,
//   ) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (BuildContext context) => PaypalCheckoutView(
//           sandboxMode: true,
//           clientId: PaymentKeys.paypalClientId,
//           secretKey: PaymentKeys.paypalSecretKey,
//           transactions: [
//             {
//               "amount": paybalTranscationData.amount.toJson(),
//               "description": "The payment transaction description.",
//               "item_list": paybalTranscationData.itemsList.toJson(),
//             }
//           ],
//           note: "Contact us for any questions on your order.",
//           onSuccess: (Map params) async {
//             log("Payment success with params: $params");
//             PaymentPayRequest paymentPayRequest = PaymentPayRequest(
//               studentId: paymentResponce.studentid ?? "unknown",
//               isPay: true,
//               expenseId: paymentResponce.expenseId ?? 0,
//               paymentType: 1, // 1 ==> paybal method
//               typeOfPayment: paymentResponce.type ?? 0,
//             );

//             context
//                 .read<PaypalCubit>()
//                 .emitPayWithPaypalStates(paymentPayRequest);

//             Navigator.pop(context);
//           },
//           onError: (error) {
//             log("Payment error: $error");
//             Navigator.pop(context);
//           },
//           onCancel: () {
//             log("Payment cancelled");
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }
/**
 * import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:sntegpito/Features/filter/presentation/manager/filter_by_date_and_gests/hotel_filter_cubit.dart';
import 'package:sntegpito/Features/hotels/data/models/search_hotel_by_name_model.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/errors/exceptions.dart';

class HotelFilterCubit extends Cubit<HotelFilterState> {
  HotelFilterCubit(this.apiConsumer) : super(HotelFilterInitial());

  final ApiConsumer apiConsumer;

  TextEditingController startDateText = TextEditingController();
  TextEditingController endDateText = TextEditingController();
  TextEditingController roomsText = TextEditingController();
  TextEditingController guestsText = TextEditingController();
  List<SearchHotelByNameModel> filterHotel = [];

  int? selectedRating;
  double? minPrice;
  double? maxPrice;

  void updateRating(int rating) {
    selectedRating = rating;
  }

  void updatePriceRange(double min, double max) {
    minPrice = min;
    maxPrice = max;
  }

  Future<void> filterHotelsByDate() async {
    try {
      emit(HotelFilterLoading());

      final Map<String, dynamic> queryParams = {};

      if (startDateText.text.isNotEmpty) {
        queryParams[ApiKey.startDateFilter] = startDateText.text;
      }
      if (endDateText.text.isNotEmpty) {
        queryParams[ApiKey.endDateFilter] = endDateText.text;
      }
      if (roomsText.text.isNotEmpty) {
        queryParams[ApiKey.roomsRequiredFilter] = roomsText.text;
      }
      if (guestsText.text.isNotEmpty) {
        queryParams[ApiKey.guestsFilter] = guestsText.text;
      }
      if (minPrice != null) {
        queryParams[ApiKey.minPriceFilter] = minPrice.toString();
      }
      if (maxPrice != null) {
        queryParams[ApiKey.maxPriceFilter] = maxPrice.toString();
      }
      if (selectedRating != null) {
        queryParams[ApiKey.minStarsFilter] = selectedRating.toString();
      }

      final response = await apiConsumer.get(
        EndPoint.hotelFilter,
        queryParameters: queryParams,
      );

      filterHotel.clear();
      for (var item in response["data"]) {
        filterHotel.add(SearchHotelByNameModel.fromJson(item));
      }

      emit(HotelFilterSuccess(hotelFilter: filterHotel));
    } on ServerException catch (e) {
      emit(HotelFilterFailure(message: e.errModel.errorMessage));
    }
  }
}

 */