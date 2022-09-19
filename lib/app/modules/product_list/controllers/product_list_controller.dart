import 'package:flutter_tech_test/app/api_service/api_service.dart';
import 'package:flutter_tech_test/app/modules/product_list/model/model_product_list.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  //TODO: Implement ProductListController

  var productList = ModelListProduct().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  fetchProduct() async {
    try {
      isLoading(true);
      var response = await APIService().getListProduct();
      print(response);
      if (response != null) {
        productList.value = response;
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // TODO method : get data list product
  void _initList() {}

  // TODO method : do refresh data list product
  void _refreshList() {}

  // TODO method : do add/remove wishlist item
  void _onWishlist() {}

  // TODO method : move to product detail screen
  void _toProductDetail() {}
}
