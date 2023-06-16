import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/enum/dio_type.dart';
import '../constants/service/service_constants.dart';
import '../error/base_error.dart';
import '../helper/service_helper.dart';
import '../model/base_model.dart';

class CoreService {
  CoreService._init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ServiceConstants.baseUrl,
        connectTimeout:const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        contentType:Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
  }
  late final Dio _dio;
  Dio get service => _dio;
  
  static final CoreService instance = CoreService._init();

  // ignore: strict_raw_type, lines_longer_than_80_chars
  Future  fetcData<T extends IBaseModel>({
    required String path,
    required IBaseModel baseModel,
    required DioType requestType,
    Map<String, dynamic>? data,
  }) async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await _dio.request(path,
          data: data,
          options: Options(
            method: requestType.dioType,
          ));

      if (response.statusCode==HttpStatus.ok||response.statusCode==HttpStatus.created) {
          DioHelper.helperCase(response, baseModel);
      }
    } on BaseError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }
}
