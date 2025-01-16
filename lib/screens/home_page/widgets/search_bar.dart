import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/home_page/home_page_logic.dart';

class SearchTextBar extends GetView<HomePageController> {
  SearchTextBar({super.key});

  final GlobalKey searchBarKey = GlobalKey();
  final textSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          key: searchBarKey,
          controller: textSearch,
          autofocus: false,
          style: StyleManager.body02_Medium(color: ColorManager.primary1Color),
          cursorColor: ColorManager.primary1Color,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: AppSize.s10),
              child: Icon(
                Icons.search,
                color: ColorManager.whiteColor,
              ),
            ),
            hintText: StringManager.searchProductsText.tr,
            hintStyle:
                StyleManager.body02_Medium(color: ColorManager.primary1Color),
            filled: true,
            fillColor: ColorManager.firstDarkColor,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.transparentColor,
                ),
                borderRadius: BorderRadius.circular(AppSize.s26)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.transparentColor,
                ),
                borderRadius: BorderRadius.circular(AppSize.s26)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.transparentColor,
                ),
                borderRadius: BorderRadius.circular(AppSize.s26)),
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              FocusScope.of(context).unfocus();

              controller.goToSearchPage(value);
              textSearch.text = "";
            }
          },
          onChanged: (value) {
            controller.searchQuery.value = value;
            controller.fetchRecommendations(value);
          },
          onTap: () {
            controller.showRecommendations.value = true;
            _showOverlay(context, controller);
          },
        ),
      ],
    );
  }

  void _showOverlay(BuildContext context, HomePageController controller) {
    final RenderBox searchBarRenderBox =
        searchBarKey.currentContext!.findRenderObject() as RenderBox;
    final searchBarPosition = searchBarRenderBox.localToGlobal(Offset.zero);
    final searchBarSize = searchBarRenderBox.size;

    controller.overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          controller.showRecommendations.value = false;
          controller.overlayEntry.remove();
        },
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: searchBarPosition.dy + searchBarSize.height,
                  left: searchBarPosition.dx + AppSize.s20,
                  width: searchBarSize.width - AppSize.s40,
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(AppSize.s8),
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 200,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.whiteColor,
                        borderRadius: BorderRadius.circular(AppSize.s8),
                      ),
                      child: Obx(() {
                        if (controller.showRecommendations.value &&
                            controller.recommendations.isNotEmpty) {
                          return ListView(
                            shrinkWrap: true,
                            children: controller.recommendations
                                .map((recommendation) {
                              return ListTile(
                                title: Text(
                                  recommendation,
                                  style: StyleManager.body02_Medium(),
                                ),
                                onTap: () {
                                  controller.goToSearchPage(recommendation);
                                  controller.showRecommendations.value = false;
                                  controller.overlayEntry.remove();
                                },
                              );
                            }).toList(),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(controller.overlayEntry);
    controller.showRecommendations.listen((show) {
      if (!show) {
        controller.overlayEntry.remove();
      }
    });
  }
}
