import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_tech_test/app/modules/product_list/controllers/product_list_controller.dart';
import 'package:flutter_tech_test/app/theme.dart';
import 'package:get/get.dart';

class CardProductGrid extends StatefulWidget {
  const CardProductGrid({Key? key}) : super(key: key);

  @override
  State<CardProductGrid> createState() => _CardProductGridState();
}

class _CardProductGridState extends State<CardProductGrid> {
  ProductListController controller = Get.put(ProductListController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value)
        return Center(
          child: CircularProgressIndicator(),
        );
      else
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.68,
              mainAxisSpacing: 21,
              crossAxisSpacing: 2),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.productList.value.data?.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (() {
                Get.toNamed('product-detail',
                    arguments: controller.productList.value.data?[index].id);
              }),
              child: Container(
                margin: EdgeInsets.only(
                  right: 17,
                  left: 17,
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xffD8D8D8),
                    )),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        Image.asset('assets/icon/ic_new.png'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Center(
                          child: Image.network(
                            '${controller.productList.value.data?[index].attributes.images[0]}',
                            height: 135,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '${controller.productList.value.data?[index].attributes.name}',
                          style: blackSemiBold.copyWith(fontSize: 12),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/icon/ic_point.png'),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${controller.productList.value.data?[index].attributes.points} poins',
                              style: greenMed.copyWith(fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RatingBar.readOnly(
                                  filledColor: yellow100,
                                  size: 18,
                                  filledIcon: Icons.star,
                                  emptyIcon: Icons.star_border,
                                  initialRating: controller.productList.value
                                      .data![index].attributes.rating,
                                  maxRating: 5,
                                ),
                                Text(
                                  '${controller.productList.value.data?[index].attributes.numOfReviews} reviews',
                                  style: blackReg.copyWith(fontSize: 10),
                                )
                              ],
                            ),
                            Icon(
                              Icons.favorite_outline,
                              color: Color(0xffbabcdd),
                              size: 24,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              ),
            );
          },
        );
    });
  }
}
