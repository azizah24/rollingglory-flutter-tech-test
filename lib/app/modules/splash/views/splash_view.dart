import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/hp.jpg'),
            SizedBox(
              height: 4,
            ),
            Text(
              'One Click',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
