import 'package:flutter/material.dart';
import 'package:ngpiteapp/screens/favorite_screen/widgets/appbar_favorite.dart';
import '/app/config/color_manager.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: CustomScrollView(
        slivers: [AppbarFavorite()],
      ),
    );
  }
}
