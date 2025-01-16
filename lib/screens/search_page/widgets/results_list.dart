import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

import 'package:ngpiteapp/screens/search_page/search_page_logic.dart';
import 'package:ngpiteapp/screens/search_page/widgets/markets_grid.dart';
import 'package:ngpiteapp/screens/search_page/widgets/products_grid.dart';

class ResultsList extends GetView<SearchPageController> {
  const ResultsList({
    super.key,
  });
  // TODO : Handle Loading States widgets
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: SizedBox(
        height: 300,
        child: Column(
          children:[ Obx(
            () => controller.isProductsSelected.value
                ? Expanded(
                  child: 
                  ProductsGrid()
                )
                : Expanded(
                  child:
                  MarketsGrid()
                ),
          ),]
        ),
      ),
    );
  }
}
