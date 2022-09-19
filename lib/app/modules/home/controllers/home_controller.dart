import 'package:flutter_tech_test/app/api_service/api_service.dart';
import 'package:flutter_tech_test/app/modules/product_list/model/model_product_list.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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
  
}
