import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sntegpito/core/api/api_consumer.dart';
import 'package:sntegpito/core/errors/exceptions.dart';
import 'package:sntegpito/core/utils/api_keys_payment.dart';

part 'paymob_payment_state.dart';

class PaymobPaymentCubit extends Cubit<PaymobPaymentState> {
  PaymobPaymentCubit(this.apiConsumer) : super(PaymobPaymentInitial());
  final ApiConsumer apiConsumer;
  Future<String> getPaymentKey(int amount, String currency) async {
    try {
      emit(PaymobPaymentLoading());
      String authenticationToken = await _getAuthenticationToken();
      int orderId = await _getOrderId(
        authenticationToken: authenticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );
      String paymentKey = await _getPaymentKey(
          authenticationToken: authenticationToken,
          amount: (100 * amount).toString(),
          orderId: orderId.toString(),
          currency: currency);
      return paymentKey;
    } on ServerException catch (e) {
      emit(PaymobPaymentFailure(errorMessage: e.errModel.errorMessage));
      throw (e);
    }
  }

  //1- Authentication token
  Future<String> _getAuthenticationToken() async {
    final response = await apiConsumer.post(
        "https://accept.paymob.com/api/auth/tokens",
        data: {"api_key": ApiKeysPayment.paymobApiKey});

    return response.data["token"];
  }

  //2- order id
  Future<int> _getOrderId(
      {required String authenticationToken,
      required String amount,
      required String currency}) async {
    final response = await apiConsumer.post(
      "https://accept.paymob.com/api/ecommerce/orders",
      data: {
        "auth_token": authenticationToken,
        "amount_cents": amount,
        "currency": currency, //Not Req
        "delivery_needed": "false",
        "items": [],
      },
    );
    return response.data["id"];
  }

  //3- payment key
  Future<String> _getPaymentKey({
    required String authenticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async {
    final response = await apiConsumer.post(
      "https://accept.paymob.com/api/acceptance/payment_keys",
      data: {
        //all of them are required
        "expiration": 3600,
        "auth_token": authenticationToken,
        "order_id": orderId,
        "integration_id": ApiKeysPayment.paymobIntegrationId,
        "amount_cents":
            amount, // (widget.modelbooking.bookingDetails!.totalPrice * 100).toInt()
        "currency": currency,

        "billing_data": {
          //have to be values
          "first_name": "Test",
          "last_name": "User",
          "email": "user@example.com",
          "phone_number": "+201000000000",

          //can set NA (Not Available)
          "apartment": "NA",
          "floor": "NA",
          "street": "NA",
          "building": "NA",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "state": "NA"
        },
      },
    );
    return response.data["token"];
  }

  //get iframe url
  Future<String> getPaymentUrl({
    required int amount,
    required String currency,
  }) async {
    final paymentKey = await getPaymentKey(amount, currency);
    final url =
        'https://accept.paymob.com/api/acceptance/iframes/${ApiKeysPayment.paymobIframeId}?payment_token=$paymentKey';
    return url;
  }
}
