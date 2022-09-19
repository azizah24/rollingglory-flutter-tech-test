import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/modules/widget/card_product.dart';
import 'package:flutter_tech_test/app/theme.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Welcome',
                    style: blackSemiBold.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'List Product',
                        style: blackSemiBold.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('product-list');
                        },
                        child: Text(
                          'See More',
                          style: greenMed.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CardProduct(),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
