import 'package:dio/dio.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import '../cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  final String? token = CacheHelper().getData(key: ApiKey.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = "en";

    options.headers['Content-Type'] = 'application/json';

    // استثناء روابط Paymob من التوكن
    final isPaymobRequest = options.path.contains("accept.paymob.com");

    if (!isPaymobRequest && token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}

