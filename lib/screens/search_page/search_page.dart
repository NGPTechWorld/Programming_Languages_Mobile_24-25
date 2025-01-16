import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/search_page/search_page_logic.dart';
import 'package:ngpiteapp/screens/search_page/widgets/header_buttons.dart';
import 'package:ngpiteapp/screens/search_page/widgets/results_list.dart';

class SearchPage extends GetView<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [SliverToBoxAdapter(child: HeaderButtons())],
          body: ResultsList(),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(controller.searchKeyword),
      backgroundColor: ColorManager.firstColor,
      leading: BackButton(
        style: ButtonStyle(
            fixedSize:
                WidgetStatePropertyAll(Size(AppMargin.m10, AppMargin.m10))),
        color: ColorManager.whiteColor,
      ),
      centerTitle: false,
    );
  }
}
