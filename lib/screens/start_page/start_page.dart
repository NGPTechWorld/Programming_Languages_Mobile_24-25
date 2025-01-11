import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/error_nointernet.dart';
import 'package:ngpiteapp/screens/start_page/start_page_logic.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final controller = Get.find<StartPageController>();
  @override
  void initState() {
    super.initState();
    controller.loadingState.value = LoadingState.loading;
    Future.delayed(Duration(seconds: 2), () {
      controller.startApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.whiteColor,
          body: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    AssetsManager.appIcon,
                    fit: BoxFit.contain,
                    width: AppSizeScreen.screenWidth / 1.8,
                    height: AppSizeScreen.screenHeight / 4,
                  ),
                ),
                controller.loadingState.value == LoadingState.loading
                    ? Padding(
                        padding: const EdgeInsets.only(top: AppPadding.p40),
                        child: CircularProgressIndicator(
                          color: ColorManager.firstColor,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          bottomSheet: Obx(() => Container(
                child: controller.loadingState == LoadingState.hasError
                    ? ErrorNointernet(
                        controller: controller,
                        context: context,
                      )
                    : null,
              ))),
    );
  }
}
