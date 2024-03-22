// ignore_for_file: use_setters_to_change_properties

import 'dart:math';

import 'package:test_intern/resources/export/core_export.dart';

class DetailsSettingController extends GetxController {
  String nameProjectItem = Get.arguments['nameProject'];
  String idProjectItem = Get.arguments['idProject'];
  String keyProjectItem = Get.arguments['keyProject'];
  TextEditingController nameController = TextEditingController();
  TextEditingController keyController = TextEditingController();
  RxInt avatarIndex = 0.obs;
  Color color = Color.fromRGBO(0, 0, 0, 0.75);

  @override
  void onInit() {
    nameController.text = nameProjectItem;
    keyController.text = keyProjectItem;
    super.onInit();
  }

  void changeAvatar(int index) {
    avatarIndex.value = index;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void deleteProject() {}

  Color randomColorGenerator() {
    var r = new Random();
    return Color.fromRGBO(r.nextInt(256), r.nextInt(256), r.nextInt(256), 0.75);
  }
}
