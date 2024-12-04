import 'package:get/get.dart';

class ShowAddressesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShowAddressesController());
  }
}

class ShowAddressesController extends GetxController {
  var addresses = <TempAddress>[
    TempAddress(
        name: "name", location: "location", street: "street", notes: "notes"),
    TempAddress(
        name: "name", location: "location", street: "street", notes: "notes"),
    TempAddress(
        name: "name", location: "location", street: "street", notes: "notes"),
    TempAddress(
        name: "name", location: "location", street: "street", notes: "notes"),
    TempAddress(
        name: "name", location: "location", street: "street", notes: "notes"),
    TempAddress(
        name: "name", location: "location", street: "street", notes: "notes")
  ].obs;

  void addAddress() {
    // TODO : go to add a new Address page , and update addresses
  }

  void deleteAddress(int index) {
    addresses.removeAt(index);
  }
}

class TempAddress {
  String name;
  String location;
  String street;
  String notes;
  TempAddress({
    required this.name,
    required this.location,
    required this.street,
    this.notes = '',
  });
}
