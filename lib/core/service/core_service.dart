import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../enum/dio_type.dart';
import '../error/base_error.dart';
import '../model/base_model.dart';

class CoreService {
  late final Dio _dio;
  Dio get service => _dio;
  final String _baseUrl = "https://pub.dev/";
  CoreService._init() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
    ));
  }
  static final CoreService instance = CoreService._init();

  Future<dynamic>? fetcData<T extends IBaseModel>(
      {required String path, required IBaseModel baseModel, required DioType requestType, Object? data}) async {
    try {
      final response = await _dio.request(path, data: data, options: Options(method: requestType.dioType.toString()));

      switch (response.statusCode) {
        case HttpStatus.ok:
          final jsonBody = response.data;
          if (jsonBody is List) {
            return jsonBody.map((data) => baseModel.fromJson(data)).toList();
          } else if (jsonBody is Map<String, Object>) {
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
