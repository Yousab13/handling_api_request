import 'package:dio/dio.dart';
import 'package:mastring_api/cache/cache_helper.dart';
import 'package:mastring_api/core/api/end_points.dart';


class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers[Apikey.token] !=null?
  'FOODAPI ${CacheHelper().getData(key: Apikey.token)}':null;
    super.onRequest(options, handler); // Make sure to call super for forwarding
  }
}
