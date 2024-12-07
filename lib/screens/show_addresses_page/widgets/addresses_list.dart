import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';
import 'package:ngpiteapp/screens/show_addresses_page/show_addresses_page_logic.dart';
import 'package:ngpiteapp/screens/show_addresses_page/widgets/address_card.dart';

class AddressesList extends GetView<ShowAddressesController> {
  const AddressesList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppPadding.p16, AppPadding.p10, AppPadding.p16, 0),
      child: Obx(() => SingleChildScrollView(
            child: Column(
                children: List.generate(
              controller.addresses.length,
              (index) => AddressCard(index: index),
            )),
          )),
    );
  }
}
