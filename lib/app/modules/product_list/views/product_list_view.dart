import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/modules/widget/card_product_grid.dart';
import 'package:flutter_tech_test/app/theme.dart';

import 'package:get/get.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  @override
  Widget build(BuildContext context) {
    ProductListController controller = Get.put(ProductListController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'List Product',
            style: blackReg200,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 36),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: black400,
              ),
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(
              height: 17,
            ),
            CardProductGrid()
          ],
        ));
  }
}
