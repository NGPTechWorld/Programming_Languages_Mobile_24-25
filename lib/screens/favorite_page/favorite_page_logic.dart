import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page.dart';
import 'package:ngpiteapp/screens/cart_page/cart_page_logic.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page.dart';

class FavoritePageController extends GetxController {
  final indexCategorySelected = 0.obs;
  final productRepo = Get.find<ImpProductsRepositories>();

  final int perPage = 3;
  var isLoadingFirst = true.obs;
  final productsPagingController = PagingController<int, dynamic>(
    firstPageKey: 1,
    invisibleItemsThreshold: 1,
  );
  @override
  onInit() {
    productsPagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newPage = await productRepo.getFavoriteProducts(
        page: pageKey,
        perPage: perPage,
      );
      final isLastPage = newPage.data.isEmpty || newPage.data.length < perPage;
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

  void refresh() {
    productsPagingController.itemList = null;
    productsPagingController.refresh();
  }

  goToProductDetails(int id) {
    Get.to(() => ProductDetailsPage(id));
  }

  goToCart() {
    Get.to(() => CartPage(), binding: CartPageBindings());
  }
}
