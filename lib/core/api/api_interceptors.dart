import 'package:dio/dio.dart';
import 'package:sntegpito/core/api/end_ponits.dart';

import '../cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  String? token = CacheHelper()
      .getData(key: ApiKey.token); // تعريف token كـ String? لقبول null

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = "en";
    options.headers.addAll({
      'Content-Type': 'application/json',
      if (token != null)
        'Authorization': 'Bearer $token', // إضافة التوكن فقط إذا لم يكن null
    });
    super.onRequest(options, handler);
  }
}
