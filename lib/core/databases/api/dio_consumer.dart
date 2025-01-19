import 'dart:async';
import 'package:dio/dio.dart';
import 'package:order_app/core/databases/api/api_consumer.dart';
import 'package:order_app/core/databases/api/end_points.dart';
import 'package:order_app/core/databases/cache/cache_helper.dart';
import 'package:order_app/core/errors/expentions.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class DioConsumer extends ApiConsumer {
  final Dio dio;

 

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baserUrl;
    _addDioInterceptor();
  }

  /// Add default interceptors
  void _addDioInterceptor() {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.path != EndPoints.login && options.path != EndPoints.signUp && options.path != EndPoints.refreshToken ) {
          String? token = await SharedPrefHelper.getString('accessToken');
          String? adminToken = await SharedPrefHelper.getString('adminAccessToken');
          print("thisi is token $token");
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          if(options.path == EndPoints.orderDelivared){
            options.headers['Authorization'] = 'Bearer $adminToken';
          }
        }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {

          print("status code is =  ${error.response?.statusCode}");
            if( error.response?.statusCode == 405 ||error.response?.statusCode == 401 )
            return await _handleTokenRefresh(error, handler);
        },
      ),
    );
  }

  /// Handle Token Refresh Logic
  Future<void> _handleTokenRefresh(
      DioException error, ErrorInterceptorHandler handler) async {

    try {
      final refreshToken = await SharedPrefHelper.getString('refreshToken');
      final response = await dio.post(
        EndPoints.refreshToken,
        options: Options(
          headers: {
            'Authorization': 'Bearer $refreshToken',
          },
        ),
      );

      final newAccessToken = response.data['new_access_token']['token'];
      await SharedPrefHelper.setData('accessToken', newAccessToken);

    } catch (e) {
      return handler.reject(DioException(
          requestOptions: error.requestOptions, error: 'Token refresh failed'));
    } 

    // Retry the original failed request
     final accessToken = await SharedPrefHelper.getString('accessToken');

    error.requestOptions.headers['Authorization'] =
        'Bearer $accessToken';
    return handler.resolve(await dio.fetch(error.requestOptions));
  }




  //!POST
  @override
  Future post(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Options ?options}) async {
    try {
      var res = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: options
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  //!GET
  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParameters,Options ?options}) async {
    try {
      var res = await dio.get(path, data: data, queryParameters: queryParameters,options: options);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  //!DELETE
  @override
  Future delete(String path, {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  //!PATCH
  @override
  Future patch(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      var res = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
