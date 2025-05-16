import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:sntegpito/Features/payment/data/models/amount_paypall_model.dart';
import 'package:sntegpito/Features/payment/data/models/items_paypal_model.dart';
import 'package:sntegpito/Features/payment/presentation/manager/confirm_payment_cubit/confirm_payment_cubit.dart';
import 'package:sntegpito/Features/payment/presentation/manager/paymob_cubit/paymob_payment_cubit.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/custoum_payment_method_card.dart';
import 'package:sntegpito/core/utils/api_keys_payment.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/item_list_paypall_model.dart';
import '../../../data/models/orginzation_models_booking/base_abstract_booking_data.dart';

class ListPaymentMethodCard extends StatefulWidget {
  final BaseBookingData baseBookingData;
  const ListPaymentMethodCard({super.key, required this.baseBookingData});

  @override
  State<ListPaymentMethodCard> createState() => _ListPaymentMethodCardState();
}

class _ListPaymentMethodCardState extends State<ListPaymentMethodCard> {
  final List<String> paymentMethodCardImages = [
    "assets/images/paypallimage.png",
    "assets/images/paymob.png"
  ];
  final List<double> imageHeights = [
    20,
    100,
  ];

  int activeindex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmPaymentCubit, ConfirmPaymentState>(
      listener: (context, state) {
        if (state is ConfirmPaymentFailure) {
          CustomSnackBar.show(context, state.errorMessage);
        } else if (state is ConfirmPaymentSucess) {
          CustomSnackBar.show(context, state.confirmPaymentModel.message!);
        } else if (state is ConfirmPaymentloading) {
          const Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.blueAccent,
          ));
        }
      },
      child: SizedBox(
        height: 62,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethodCardImages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 40, right: 20),
              child: GestureDetector(
                onTap: () {
                  var transcationData = getTranscationData();
                  if (index == 0) {
                    executePaypallMethod(context, transcationData);
                  } else if (index == 1) {
                    executePaymobMethod(context);
                  }
                  activeindex = index;

                  setState(() {});
                },
                child: PaymentMethodCard(
                  image: paymentMethodCardImages[index],
                  isActive: activeindex == index,
                  height: imageHeights[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //paypall

  void executePaypallMethod(
      BuildContext context,
      ({
        AmountPaypallModel amount,
        ItemListPaypallModel itemList
      }) transcationData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeysPayment.clientIdpaypal,
          secretKey: ApiKeysPayment.serectkeypaypal,
          transactions: [
            {
              "amount": transcationData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transcationData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              CustomSnackBar.show(context, "paypall done");
            });
            //context.read<ConfirmPaymentCubit>().verifyconfirmpayment();
          },
          onError: (error) {
            log("onError: $error");
            //Navigator.pop(context);
            CustomSnackBar.show(context, "paypall Failed", isError: true);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountPaypallModel amount, ItemListPaypallModel itemList})
      getTranscationData() {
    var amount = AmountPaypallModel(
      total: widget.baseBookingData.totalPrice.toString(),
      // widget.modelbooking.bookingDetails!.totalPrice.toString(),
      currency: "USD",
      details: Details(
        subtotal: widget.baseBookingData.totalPrice.toString(),
        //widget.modelbooking.bookingDetails!.totalPrice.toString(),
        shipping: "0",
        shippingDiscount: 0,
      ),
    );
    List<Items> itemsRoom = [
      Items(
        name: widget.baseBookingData.name,
        //widget.modelbooking.bookingDetails!.room!.roomType,
        quantity: 1,
        price: widget.baseBookingData.totalPrice.toString(),
        // widget.modelbooking.bookingDetails!.totalPrice.toString(),
        currency: "USD",
      ),
    ];
    var itemList = ItemListPaypallModel(items: itemsRoom);
    return (amount: amount, itemList: itemList);
  }

//paymob

  void executePaymobMethod(BuildContext context) async {
    try {
      final cubit = context.read<PaymobPaymentCubit>();

      final paymentUrl = await cubit.getPaymentUrl(
        amount: widget.baseBookingData.totalPrice.toInt(),
        //widget.modelbooking.bookingDetails!.totalPrice!.toInt(),
        currency: "EGP",
      );

      final uri = Uri.parse(paymentUrl);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        CustomSnackBar.show(
          context,
          "Payment link cannot be opened",
          isError: true,
        );
      }
    } catch (e) {
      CustomSnackBar.show(
        context,
        "An error occurred during payment: $e",
        isError: true,
      );
    }
  }
}
/*

class ListPaymentMethodCard extends StatefulWidget {
  final DetailsBookingBeforePaymentModel modelbooking;
  const ListPaymentMethodCard({super.key, required this.modelbooking});

  @override
  State<ListPaymentMethodCard> createState() => _ListPaymentMethodCardState();
}

class _ListPaymentMethodCardState extends State<ListPaymentMethodCard> {
  final List<String> paymentMethodCardImages = [
    "assets/images/paypallimage.png",
    "assets/images/paymob.png"
  ];
  final List<double> imageHeights = [
    20,
    100,
  ];

  int activeindex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmPaymentCubit, ConfirmPaymentState>(
      listener: (context, state) {
        if (state is ConfirmPaymentFailure) {
          CustomSnackBar.show(context, state.errorMessage);
        } else if (state is ConfirmPaymentSucess) {
          CustomSnackBar.show(context, state.confirmPaymentModel.message!);
        } else if (state is ConfirmPaymentloading) {
          const Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.blueAccent,
          ));
        }
      },
      child: SizedBox(
        height: 62,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethodCardImages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 40, right: 20),
              child: GestureDetector(
                onTap: () {
                  var transcationData = getTranscationData();
                  if (index == 0) {
                    executePaypallMethod(context, transcationData);
                  } else if (index == 1) {
                    executePaymobMethod(context);
                  }
                  activeindex = index;

                  setState(() {});
                },
                child: PaymentMethodCard(
                  image: paymentMethodCardImages[index],
                  isActive: activeindex == index,
                  height: imageHeights[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //paypall

  void executePaypallMethod(
      BuildContext context,
      ({
        AmountPaypallModel amount,
        ItemListPaypallModel itemList
      }) transcationData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeysPayment.clientIdpaypal,
          secretKey: ApiKeysPayment.serectkeypaypal,
          transactions: [
            {
              "amount": transcationData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transcationData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              CustomSnackBar.show(context, "paypall done");
            });
            //context.read<ConfirmPaymentCubit>().verifyconfirmpayment();
          },
          onError: (error) {
            log("onError: $error");
            //Navigator.pop(context);
            CustomSnackBar.show(context, "paypall Failed", isError: true);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountPaypallModel amount, ItemListPaypallModel itemList})
      getTranscationData() {
    var amount = AmountPaypallModel(
      total: widget.modelbooking.bookingDetails!.totalPrice.toString(),
      currency: "USD",
      details: Details(
        subtotal: widget.modelbooking.bookingDetails!.totalPrice.toString(),
        shipping: "0",
        shippingDiscount: 0,
      ),
    );
    List<Items> itemsRoom = [
      Items(
        name: widget.modelbooking.bookingDetails!.room!.roomType,
        quantity: 1,
        price: widget.modelbooking.bookingDetails!.totalPrice.toString(),
        currency: "USD",
      ),
    ];
    var itemList = ItemListPaypallModel(items: itemsRoom);
    return (amount: amount, itemList: itemList);
  }

//paymob

  void executePaymobMethod(BuildContext context) async {
    try {
      final cubit = context.read<PaymobPaymentCubit>();

      final paymentUrl = await cubit.getPaymentUrl(
        amount: widget.modelbooking.bookingDetails!.totalPrice!.toInt(),
        currency: "EGP",
      );

      final uri = Uri.parse(paymentUrl);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        CustomSnackBar.show(
          context,
          "Payment link cannot be opened",
          isError: true,
        );
      }
    } catch (e) {
      CustomSnackBar.show(
        context,
        "An error occurred during payment: $e",
        isError: true,
      );
    }
  }
}
*/
