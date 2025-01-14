import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/screens/search_page/search_page_logic.dart';

class SearchTextBar extends GetView<SearchPageController> {
  SearchTextBar({super.key});

  // Add a GlobalKey to track the search bar's position
  final GlobalKey searchBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TextField(
          key: searchBarKey, // Assign the GlobalKey to the TextField
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
            hintText: controller.searchKeyword,
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
            // Navigate to the search page when the user presses the search key
            if (value.isNotEmpty) {
               FocusScope.of(context).unfocus();
              // controller.goToSearchPage(value);
            }
          },
          onChanged: (value) {
            // controller.searchQuery.value = value;
            // controller.fetchRecommendations(value);
          },
          onTap: () {
            // Show the popout menu when the user taps the search bar
            // controller.showRecommendations.value = true;
            _showOverlay(context, controller);
          },
        ),
      ],
    );
  }

  void _showOverlay(BuildContext context, SearchPageController controller) {
    // Get the search bar's position and size
    final RenderBox searchBarRenderBox =
        searchBarKey.currentContext!.findRenderObject() as RenderBox;
    final searchBarPosition = searchBarRenderBox.localToGlobal(Offset.zero);
    final searchBarSize = searchBarRenderBox.size;

    // Declare the OverlayEntry variable outside the builder
    late OverlayEntry overlayEntry;

    // Define the OverlayEntry
    overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          // controller.showRecommendations.value = false;
          overlayEntry.remove(); // Remove the overlay
        },
        child: Material(
          color: Colors.transparent, // Transparent background to catch taps
          child: Container(
            width: MediaQuery.of(context).size.width, // Full width
            height: MediaQuery.of(context).size.height, // Full height
            child: Stack(
              children: [
                Positioned(
                  top: searchBarPosition.dy +
                      searchBarSize.height, // Position below the search bar
                  left: searchBarPosition.dx +
                      AppSize.s20, // Align with the search bar's left edge
                  width: searchBarSize.width -
                      AppSize.s40, // Match the search bar's width
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(AppSize.s8),
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 200, // Limit the height of the overlay
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.whiteColor,
                        borderRadius: BorderRadius.circular(AppSize.s8),
                      ),
                      child: Obx(() {
                        if(controller.searchKeyword == ""){
                        // if (controller.showRecommendations.value &&
                            // controller.recommendations.isNotEmpty) {
                        //   return ListView(
                        //     shrinkWrap:
                        //         true, // Ensure the ListView takes only the required space
                        //     children: controller.recommendations
                        //         .map((recommendation) {
                        //       return ListTile(
                        //         title: Text(
                        //           recommendation,
                        //           style: StyleManager.body02_Medium(),
                        //         ),
                        //         onTap: () {
                        //           controller.goToSearchPage(recommendation);
                        //           controller.showRecommendations.value = false;
                        //           overlayEntry.remove(); // Remove the overlay
                        //         },
                        //       );
                        //     }).toList(),
                        //   );
                        } else {
                          return const SizedBox
                              .shrink(); // Hide if no recommendations
                        }
                        return Container();
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

    // Insert the overlay into the Overlay
    Overlay.of(context).insert(overlayEntry);

    // Listen for changes to hide the overlay
    // controller.showRecommendations.listen((show) {
    //   if (!show) {
    //     overlayEntry.remove();
    //   }
    // });
  }
}
