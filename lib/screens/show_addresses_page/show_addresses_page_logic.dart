import 'package:get/get.dart';
import 'package:ngpiteapp/screens/address_page/address_page.dart';
import 'package:ngpiteapp/screens/address_page/address_page_logic.dart';

class ShowAddressesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShowAddressesController());
  }
}

class ShowAddressesController extends GetxController {
  var addresses = <TempAddress>[
    TempAddress(
        name: "namas;ldfjl;asdjf;lkasjdfl;sakdje", location: "locatioasdl;fj;lasdjfl;kasdjfljasd;lkjf;lasdjf;lsakjn", street: "streed;lskdaj;lkfja;lsdjflkajs;ldf;asdf;lkajsd;flksadfj;t", notes: "notesسيبسيبستمكتكمسيتبمكنستيمكبنتسمكينتبمنكسيتمبتنسيمنكبتسمكيبتمكسيتبمكسيتبمتس"),
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
    // TODO: update addresses
    Get.to(() => AddressPage(), binding: AddressPageBinding());
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
