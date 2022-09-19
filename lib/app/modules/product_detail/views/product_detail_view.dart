import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tech_test/app/theme.dart';

import 'package:get/get.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  ProductDetailController controller = Get.put(ProductDetailController());
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Gift detail',
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
        body: Obx((() {
          if (controller.isLoading.value)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            return ListView(
              children: [
                SizedBox(
                  height: 4,
                ),
                Stack(
                  children: [
                    Center(
                      child: Image.network(
                        '${controller.productList.value.data?.attributes.images[0]}',
                        height: 360,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        children: [
                          Image.asset('assets/icon/ic_new.png'),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 36, right: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${controller.productList.value.data?.attributes.name}',
                        style: blackSemiBold.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Html(
                        data:
                            controller.productList.value.data?.attributes.info,
                        style: {
                          "p": Style(
                              padding: EdgeInsets.zero,
                              fontSize: FontSize(12.0),
                              fontWeight: FontWeight.w400,
                              color: grey200,
                              maxLines: 1)
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16, bottom: 28),
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: grey100),
                              bottom: BorderSide(color: grey100)),
                        ),
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 26, top: 10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: grey100),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: RatingBar.readOnly(
                                            filledColor: yellow100,
                                            size: 12,
                                            filledIcon: Icons.star,
                                            emptyIcon: Icons.star_border,
                                            initialRating: controller
                                                .productList
                                                .value
                                                .data!
                                                .attributes
                                                .rating,
                                            maxRating: 5,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${controller.productList.value.data?.attributes.numOfReviews}\nreviews',
                                          textAlign: TextAlign.center,
                                          style:
                                              blackReg.copyWith(fontSize: 12),
                                        )
                                      ]),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 26, right: 26, top: 10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: grey100),
                                    ),
                                  ),
                                  child: Column(children: [
                                    Image.asset(
                                      'assets/icon/ic_point_1.png',
                                      height: 20,
                                    ),
                                    Text(
                                      '${controller.productList.value.data?.attributes.points}',
                                      textAlign: TextAlign.center,
                                      style: greenMed.copyWith(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      'Points',
                                      textAlign: TextAlign.center,
                                      style: blackReg.copyWith(fontSize: 12),
                                    ),
                                  ]),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 24, top: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.favorite_outline,
                                          color: grey100,
                                        ),
                                        Text(
                                          'Add to\nWishlist',
                                          textAlign: TextAlign.center,
                                          style:
                                              blackReg.copyWith(fontSize: 12),
                                        )
                                      ]),
                                )
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Info Produk',
                        style: blackSemiBold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      controller.tap.value
                          ? Html(
                              data: controller
                                  .productList.value.data?.attributes.info,
                              style: {
                                "p": Style(
                                  padding: EdgeInsets.zero,
                                  fontSize: FontSize(12.0),
                                  fontWeight: FontWeight.w400,
                                  color: grey200,
                                )
                              },
                            )
                          : Html(
                              data: controller.productList.value.data
                                  ?.attributes.description,
                              style: {
                                "p": Style(
                                    padding: EdgeInsets.zero,
                                    fontSize: FontSize(12.0),
                                    fontWeight: FontWeight.w400,
                                    color: grey200,
                                    maxLines: 2)
                              },
                            ),
                      SizedBox(
                        height: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (tap == true) {
                            tap = false;
                            controller.tap.value = false;
                          } else {
                            tap = true;
                            controller.tap.value = true;
                            ;
                          }
                        },
                        child: Text(
                          'Lihat Semua',
                          style: greenMed.copyWith(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.393,
                            height: 43,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: grey100),
                                borderRadius: BorderRadius.circular(99)),
                            child: Row(children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: controller.i.value == 0
                                      ? () {}
                                      : () {
                                          controller.decrement();
                                        },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                        color: grey100.withOpacity(0.4),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(99),
                                            bottomLeft: Radius.circular(99))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.remove,
                                          color: Color(0xff4A4A4A),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(99),
                                          bottomLeft: Radius.circular(99))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${controller.i.value}',
                                        style:
                                            blackRegLato.copyWith(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.increment();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                        color: grey100.withOpacity(0.4),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(99),
                                            bottomRight: Radius.circular(99))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Color(0xff4A4A4A),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.393,
                              height: 43,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: green200),
                                  borderRadius: BorderRadius.circular(99)),
                              child: Center(
                                  child: Text(
                                'Add to cart',
                                style: blackReg.copyWith(color: green200),
                              ))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: green200,
                            borderRadius: BorderRadius.circular(99)),
                        padding: EdgeInsets.all(13),
                        child: Center(
                            child: Text(
                          'Redeem',
                          style: blackReg.copyWith(color: Colors.white),
                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        })));
  }
}
