
import 'package:get/get.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:ngpiteapp/data/enums/app_state_enum.dart';
import 'package:ngpiteapp/data/repositories/auth_repositories.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';

class StartPageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put(StartPageController());
  }
}

class StartPageController extends GetxController {
  final isConnectedPage = true.obs;
  final AuthRepositories = Get.find<ImpAuthRepositories>();
  CacheServicesSharedPreferences cache =
      Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;
  var appState = AppState.run.obs;

  startApp() {
    loadingState.value = LoadingState.loading;
  }
}
