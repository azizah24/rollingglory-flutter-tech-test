import 'package:flutter_tech_test/app/api_service/api_service.dart';
import 'package:flutter_tech_test/app/modules/product_detail/model/model_product_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProductDetailController extends GetxController {
  //TODO: Implement ProductDetailController
  var productList = ModelProductDetail().obs;
  var isLoading = true.obs;
  var id = Get.arguments;
  var tap = false.obs;
  var i = 1.obs;

  @override
  void onInit() {
    super.onInit();
    _initProductDetail(id);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // TODO method : get data detail product
  void _initProductDetail(id) async {
    try {
      isLoading(true);
      var response = await APIService().getProductDetail(id);
      print(response);
      if (response != null) {
        productList.value = response;
      }
    } finally {
      isLoading(false);
    }
  }

  void increment() => i.value++;

   void decrement() => i.value--;

  // TODO method : see/hide product description
  void _onSeeMoreDescription() {}

  // TODO method : do add/remove wishlist item
  void _onWishlist() {}

  // TODO method : increase quantity of product
  void _addQuantity() {}

  // TODO method : decrease quantity of product
  void _detractQuantity() {}

  // TODO method : add product to cart
  void _addToCart() {}

  // TODO method : do proceed buy/redeem product
  void _redeemProduct() {}
}
