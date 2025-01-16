
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/data/entities/market_entitie.dart';
import 'package:ngpiteapp/data/entities/products_card._entite.dart';
import 'package:ngpiteapp/data/entities/products_card_search_entite.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/data/repositories/markets_repositories.dart';
import 'package:ngpiteapp/data/repositories/products_repositories.dart';


class SearchPageBindings extends Bindings {
  final String searchKeyword;

  SearchPageBindings({required this.searchKeyword});

  @override
  void dependencies() {
    Get.put(SearchPageController(searchKeyword : searchKeyword));
  }
}



class SearchPageController extends GetxController {
  final productRepo = Get.find<ImpProductsRepositories>();
  final marketRepo = Get.find<ImpMarketsRepositories>();
  SearchPageController({required this.searchKeyword});
  
  final searchKeyword;
  var isProductsSelected = true.obs;
  var loadingState = LoadingState.idle.obs;

  final completedOrders = [].obs;
  final incompletedOrders = [].obs;
  
  final productsPagingController = PagingController<int, ProductsCardSearchEntite>(
    firstPageKey: 1,
    invisibleItemsThreshold: 2,
  );
  final marketsPagingController = PagingController<int, MarketEntitie>(
    firstPageKey: 2,
    invisibleItemsThreshold: 1,
  );

  var productsPerPage = 4;
  var marketsPerPage = 4;


  onInit() async {
    productsPagingController.itemList = null;
    productsPagingController.addPageRequestListener((pageKey) {
      getProducts(pageKey);
    });

    marketsPagingController.itemList = null;
    marketsPagingController.addPageRequestListener((pageKey) {
      getMarkets(pageKey);
    });
    productsPagingController.refresh();
    getMarkets(1);
    super.onInit();
  }

  getProducts(int pageKey) async {
    try {
      final newPage = await productRepo.getProductsByName(
          page: pageKey, perPage: productsPerPage, productName: searchKeyword);
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

  getMarkets(int pageKey) async { 
    try {
      print('Fetching page: $pageKey');
      final newPage =
          await marketRepo.getMarketsByName(page: pageKey, perPage: marketsPerPage , market_name: searchKeyword);
      final isLastPage =
          newPage.data.isEmpty || newPage.data.length < productsPerPage;
      if (isLastPage) {
        marketsPagingController.appendLastPage(newPage.data);
      } else {
        final nextPageKey = pageKey + 1;
        marketsPagingController.appendPage(newPage.data, nextPageKey);
      }
    } catch (error) {
      marketsPagingController.error = error;
    }
  }


/*   getOrders(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final responseCompleted = await OrdersRepositories.getOrdersByStatus(
        status: statusID[OrderStatusEnum.completed]!);

    final responseRejected = await OrdersRepositories.getOrdersByStatus(
        status: statusID[OrderStatusEnum.rejected]!);

    final responseCanceled = await OrdersRepositories.getOrdersByStatus(
        status: statusID[OrderStatusEnum.cancelled]!);
    if (responseCompleted.success &&
        responseCanceled.success &&
        responseRejected.success) {
      // TODO : Check whether to reverse them or not
      completedOrders.addAll(responseCompleted.data.reversed);
      incompletedOrders.addAll(responseRejected.data.reversed);
      incompletedOrders.addAll(responseCanceled.data.reversed);
      loadingState.value = LoadingState.doneWithData;
    } else {
      _handleErrorMessage(
          responseCanceled, responseRejected, responseCompleted, context);
    }
  }
 */
/*   void _handleErrorMessage(
      AppResponse<dynamic> responseCanceled,
      AppResponse<dynamic> responseRejected,
      AppResponse<dynamic> responseCompleted,
      BuildContext context) {
    String msg = "Error! \n";
    if (responseCanceled.networkFailure != null)
      msg += "\nCanceled Orders : " + responseCanceled.networkFailure!.message;
    if (responseRejected.networkFailure != null)
      msg += "\nRejected Orders : " + responseRejected.networkFailure!.message;
    if (responseCompleted.networkFailure != null)
      msg +=
          "\nCompleted Orders : " + responseCompleted.networkFailure!.message;
    SnackBarCustom.show(context, msg);
    loadingState.value = LoadingState.hasError;
  }

  List get orders =>
      isCompletedSelected.value ? completedOrders : incompletedOrders;

  void onTap(int id, int stautsId) {
    Get.to(
        () => OrderDetailsPage(
              orderId: id,
              statusId: stautsId,
            ),
        binding: OrderDetailsBinding());
  } */
}
