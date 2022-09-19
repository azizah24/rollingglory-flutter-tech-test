import 'dart:async';

import 'package:flutter_tech_test/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onInit() {
    super.onInit();
   // _toProductList();
  }

  @override
  void onReady() {
    super.onReady();
    _toProductList();
  }

  @override
  void onClose() {}

  // TODO method : move to product list screen
  void _toProductList() {
    Timer(Duration(milliseconds: 1000), () => Get.toNamed(Routes.HOME));
  }
}
