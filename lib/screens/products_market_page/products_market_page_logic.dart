import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';

class ProductsMarketPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsMarketPageController());
  }
}

class ProductsMarketPageController extends GetxController {
  // int index = 0;
  final productRepo = Get.find<ImpProductsRepositories>();



  final productsPagingController = PagingController<int, ProductsCardEntite>(
    firstPageKey: 1,
    invisibleItemsThreshold: 2,
  );

  int currentPage = 1;

  var productsPerPage = 4;


  onInit() async {
    productsPagingController.itemList = null;
    productsPagingController.addPageRequestListener((pageKey) {
      getProducts(pageKey);
    });


    productsPagingController.refresh();
    super.onInit();
  }

  getProducts(int pageKey) async {
    try {
      final newPage = await productRepo.getProducts(
          page: pageKey, perPage: productsPerPage);
      print('Fetching page: $pageKey');
      final isLastPage =
          newPage.data.isEmpty || newPage.data.length < productsPerPage;
      if (isLastPage) {
        productsPagingController.appendLastPage(newPage.data);
      } else {
        final nextPageKey = pageKey + 1;
        productsPagingController.appendPage(newPage.data, nextPageKey);
      }
    } catch (error) {
      productsPagingController.error = error;
    }
  }

}
