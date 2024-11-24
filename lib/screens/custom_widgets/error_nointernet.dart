import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class ErrorNointernet extends StatelessWidget {
  final controller;
  final context;
  const ErrorNointernet(
      {super.key, required this.controller, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizeScreen.screenHeight / 24,
      color: ColorManager.blackColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringManager.nointernet,
            style: StyleManager.body01_Medium(color: ColorManager.whiteColor),
          ),
          IconButton(
              onPressed: () {
                controller.restApp(context);
              },
              icon: Icon(
                Icons.replay_outlined,
                color: ColorManager.whiteColor,
              )),
        ],
      ),
    );
  }
}
