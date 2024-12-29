import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';
import 'package:ngpiteapp/screens/home_page/widgets/products_grid.dart';
import 'package:ngpiteapp/screens/home_page/widgets/sliver_app_bar_home.dart';
import 'package:ngpiteapp/screens/home_page/widgets/markets_list.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(

        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBarHome(),
          MarketsList(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p10),
              child: Text(
                StringManager.allProducts.tr,
                style: StyleManager.body01_Regular(fontsize: AppSize.s30),
              ),
            ),
          ),
        ],
        body: ProductsGrid(),
      ),
    );
  }
}
