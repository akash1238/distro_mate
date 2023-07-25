import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'controllers/GetxNetworkManager.dart';
import 'controllers/auth_controller.dart';

class StoreBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => GetXNetworkManager(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
