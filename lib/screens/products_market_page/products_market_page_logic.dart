import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/module/product_model.dart';
import 'package:ngpiteapp/data/repositories/markets_repositories.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';

class ProductsMarketPageBindings extends Bindings {
  final id;
  ProductsMarketPageBindings({required this.id});
  @override
  void dependencies() {
    Get.put(ProductsMarketPageController(id: id));
  }
}

class ProductsMarketPageController extends GetxController {
  // int index = 0;
  final marketsRepo = Get.find<ImpMarketsRepositories>();
  final int id;
  ProductsMarketPageController({required this.id});

  final productsPagingController = PagingController<int, ProductEntitie>(
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
      final newPage = await marketsRepo.getProductsForMarket(
          market_id: id, page: pageKey, perPage: productsPerPage);
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
