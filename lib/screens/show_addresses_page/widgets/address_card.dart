import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/assets_manager.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/string_manager.dart';
import 'package:ngpiteapp/app/config/style_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/show_addresses_page/show_addresses_page_logic.dart';

class AddressCard extends GetView<ShowAddressesController> {
  const AddressCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final TempAddress address = controller.addresses[index];
    return Column(
      children: [
        Card(
          elevation: 0,
          margin: EdgeInsets.symmetric(vertical: AppMargin.m8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s14),
            side: BorderSide(
              color: ColorManager.firstColor,
              width: AppSize.s2,
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            iconColor: ColorManager.firstColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s14),
            ),
            title: Text(
              address.name,
              style: StyleManager.h3_Medium(),
            ),
            tileColor: ColorManager.whiteColor,
            splashColor: ColorManager.transparentColor,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.location,
                  style: StyleManager.body01_Medium(),
                ),
                Text(
                  address.street,
                  style: StyleManager.body01_Regular(),
                ),
                Text(
                  address.notes,
                  style: StyleManager.body01_Regular(fontsize: AppSize.s14),
                ),
              ],
            ),
            leading: SvgPicture.asset(AssetsManager.markerSvg),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: ColorManager.firstColor),
              onPressed: () => _showDeleteDialog(index),
            ),
            onLongPress: () => _showDeleteDialog(index),
          ),
        ),
        if(index==controller.addresses.length-1) SizedBox(height: AppSize.s70,)
      ],
    );
  }

  void _showDeleteDialog(int index) async {
    await Get.defaultDialog(
      title: StringManager.showAddressesDeleteDialogTitle.tr,
      middleText: StringManager.showAddressesDeleteDialogText.tr,
      cancel: MaterialButton(
        onPressed: () {
          Get.back();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: Text(
          StringManager.showAddressesDeleteDialogCancel.tr,
          style: TextStyle(color: ColorManager.firstColor),
        ),
      ),
      confirm: MaterialButton(
        onPressed: () {
          controller.deleteAddress(index);
          Get.back();
        },
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s20)),
        color: ColorManager.firstColor,
        child: Text(
          StringManager.showAddressesDeleteDialogDelete.tr,
          style: TextStyle(color: ColorManager.whiteColor),
        ),
      ),
      confirmTextColor: Colors.white,
    );
  }
}
