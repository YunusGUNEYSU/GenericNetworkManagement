import '../core/enum/dio_type.dart';
import '../core/service/core_service.dart';
import 'model/test_model.dart';

class Test {
  void test() {
    // ignore: unused_local_variable
    final result = CoreService.instance.fetcData<YourModel>(
      path: 'aa',
      requestType: DioType.post,
      baseModel: YourModel(),
    );
  }
}
