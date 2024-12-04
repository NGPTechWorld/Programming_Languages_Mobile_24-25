import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/home_page/widgets/search_bar.dart';

class SliverAppBarHome extends StatefulWidget {
  const SliverAppBarHome({super.key});

  @override
  _SliverAppBarHomeState createState() => _SliverAppBarHomeState();
}

class _SliverAppBarHomeState extends State<SliverAppBarHome> {
  ValueNotifier<int> cartItemCount = ValueNotifier<int>(0);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      expandedHeight: AppSizeScreen.screenHeight / 4,
      backgroundColor: ColorManager.firstColor,
      stretch: true,
      title: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Home",
              style:
                  StyleManager.h2_Semibold(color: ColorManager.primary1Color),
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.whiteColor,
            )
          ],
        ),
      ),
      flexibleSpace: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [SearchTextBar()],
          ),
        ),
      ),
    );
  }
}
