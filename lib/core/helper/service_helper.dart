import 'package:dio/dio.dart';
import '../model/base_model.dart';

class DioHelper {
  DioHelper._();
  static Future helperCase(Response response, IBaseModel model) async {
    final jsonBody = await response.data;
    if (jsonBody is List) {
      return jsonBody.map((data) => model.fromJson(data)).toList();
    } else if (jsonBody is Map<String, dynamic>) {
      return model.fromJson(jsonBody);
    }
  }
}
