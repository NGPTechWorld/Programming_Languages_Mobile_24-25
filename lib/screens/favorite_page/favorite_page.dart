import 'package:flutter/material.dart';
import 'package:ngpiteapp/screens/favorite_page/widgets/appbar_favorite.dart';
import 'package:ngpiteapp/screens/favorite_page/widgets/favorite_products_list.dart';
import '/app/config/color_manager.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                AppbarFavorite(),
              ],
          body: Container()
          // FavoriteProductsList(),
          ),
    );
  }
}
