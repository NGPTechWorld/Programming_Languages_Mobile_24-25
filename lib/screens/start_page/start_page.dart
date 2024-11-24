import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/data/enums/app_state_enum.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/custom_widgets/error_nointernet.dart';
import 'package:ngpiteapp/screens/start_page/start_page_logic.dart';
import 'package:ngpiteapp/screens/start_page/start_page_widgets/start_page_widgets.dart';

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

    controller.checkInternetAndFetchData(context);
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
                controller.appState == AppState.update
                    ? UpdateMode(controller: controller)
                    : Container(),
                controller.appState == AppState.repair
                    ? MaintenanceMode(controller: controller)
                    : Container(),
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
          bottomSheet: Obx(() => Padding(
                padding: EdgeInsets.all(1),
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
