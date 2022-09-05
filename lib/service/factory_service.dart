import 'package:sepet/service/i_service.dart';
import 'package:sepet/service/service_firebase.dart';
import 'package:sepet/service/service_hive.dart';
import 'package:sepet/utilities/app_constants.dart';
import 'package:sepet/utilities/enums.dart';

class FactoryService {
  static IService instance() {
    switch (AppConstants.service) {
      case serviceType.HIVE:
        return ServiceHive.instance;
      case serviceType.FIREBASE:
        return ServiceFirebase.instance;
      default:
        return ServiceHive.instance;
    }
  }
}
