import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class Map extends StatelessWidget {
  const Map({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children:[
        SizedBox(height: AppSizeScreen.screenHeight * 0.01),
         Image.asset(
        AssetsManager.mapImage,
        height: AppSizeScreen.screenHeight * 0.2,
      ),]
    );
  }
}


