import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/entities/market_entitie.dart';
import 'package:ngpiteapp/screens/products_market_page/products_market_page_logic.dart';
import 'package:ngpiteapp/screens/products_market_page/widgets/market_header_page.dart';

class ProductsMarketPage extends GetView<ProductsMarketPageController> {
  final MarketEntitie market;
  const ProductsMarketPage(this.market, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MarketHeaderPage(market: market),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p10),
                child: Text(
                  StringManager.allProducts.tr,
                  style: StyleManager.body01_Medium(fontsize: AppSize.s30),
                ),
              ),
            ),
          ],
          body: Container(),
          //ProductsGrid(),
        ),
      ),
    );
  }
}
