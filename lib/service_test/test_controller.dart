import '../core/enum/dio_type.dart';
import '../core/model/base_model.dart';
import '../core/service/core_service.dart';

class Test {
  void test() {
    // ignore: unused_local_variable
    final result = CoreService.instance.fetcData(
      path: "aa",
      requestType: DioType.post,
      baseModel: YourModel(),
    );
  }
}

class YourModel extends IBaseModel {
  @override
  fromJson(Map<String, Object> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
