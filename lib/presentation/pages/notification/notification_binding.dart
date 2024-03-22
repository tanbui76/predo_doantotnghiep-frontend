import 'package:get/get.dart';
//import 'package:template/presentation/pages/notification/notification_controller.dart';
import 'package:test_intern/presentation/pages/notification/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController);
  }
}
