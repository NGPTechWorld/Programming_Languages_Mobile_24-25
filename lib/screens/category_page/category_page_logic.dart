import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/category_repositoris.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';
import 'package:ngpiteapp/screens/product_details_screen/product_details_page.dart';

class CategoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryPageController());
  }
}

class CategoryPageController extends GetxController {
  final indexCategorySelected = 0.obs;
  final categories = [].obs;
  final categoriesRepo = Get.find<ImpCategoryRepositories>();
  final productRepo = Get.find<ImpProductsRepositories>();

  bool categoryChanged = false;
  final int perPage = 3;
  var isLoadingCategories = false.obs;
  var isLoadingFirst = LoadingState.loading;
  final productsPagingController = PagingController<int, ProductsCardEntite>(
    firstPageKey: 1,
    invisibleItemsThreshold: 1,
  );

  var h200 = 200.0.obs;

  var isLoadingProducts = false;
  onInit() async {
    await getCategories();
    productsPagingController.itemList = null;
    productsPagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> fetchPage(int pageKey) async {
    if (categoryChanged && pageKey > 1) {
      categoryChanged = false;
      return;
    }
    isLoadingProducts = true;
    try {
      final newPage = await productRepo.getProductsByCategory(
        page: pageKey,
        perPage: perPage,
        categoryID: categories[indexCategorySelected.value].id,
      );
      print('Fetching page: $pageKey');
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
    isLoadingProducts = false;
  }

  void refresh() {
    productsPagingController.itemList = null;
    productsPagingController.refresh();
    categoryChanged = true;
  }

  getCategories() async {
    isLoadingCategories.value = true;
    final response = await categoriesRepo.getAllCategories();
    if (response.success) {
      categories.clear();
      categories.addAll(response.data);
    } else {
      // SnackBarCustom.show(context, response.networkFailure!.message);
    }
    isLoadingCategories.value = false;
  }

  goToProductDetails(int id) {
    Get.to(() => ProductDetailsPage(id));
  }
}
