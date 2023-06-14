import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../enum/dio_type.dart';
import '../error/base_error.dart';
import '../model/base_model.dart';

class CoreService {
  CoreService._init() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
    ),);
  }
  late final Dio _dio;
  Dio get service => _dio;
  final String _baseUrl = 'https://pub.dev/';
  static final CoreService instance = CoreService._init();

  // ignore: strict_raw_type, lines_longer_than_80_chars
  Future fetcData<T extends IBaseModel>(
      {required String path,
       required IBaseModel baseModel, 
       required DioType requestType, 
       Object? data,}) async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await _dio.request(path, data: data, options: Options(method: requestType.dioType));

      switch (response.statusCode) {
        case HttpStatus.ok:
          final jsonBody = response.data;
          if (jsonBody is List) {
            return jsonBody.map((data) => baseModel.fromJson(data)).toList();
          } else if (jsonBody is Map<String, dynamic>) {
            return baseModel.fromJson(jsonBody);
          }
          return jsonBody;
      }
    } on BaseError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }
}
