import '../../core/constants/enum/dio_type.dart';
import '../../core/service/core_service.dart';
import '../model/test_model.dart';

class ServiceTest {
  //! Kullanırken generic olarak modelini belirtmelisin
  final service = CoreService.instance.fetcData<YourModel>(path: 'posts', model: YourModel(), requestType: DioType.get);
  Future getService()async {
    return await service;
  }
}
