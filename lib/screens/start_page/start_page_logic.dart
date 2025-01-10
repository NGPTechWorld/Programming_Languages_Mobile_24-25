import 'package:get/get.dart';
import 'package:ngpiteapp/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:ngpiteapp/data/enums/app_state_enum.dart';
import 'package:ngpiteapp/data/repositories/users_repositories.dart';
import 'package:ngpiteapp/data/enums/loading_state_enum.dart';
import 'package:ngpiteapp/screens/category_page/category_page_logic.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_custom.dart';
import 'package:ngpiteapp/screens/curved_navigation_bar/curved_navigation_bar_logic.dart';
import 'package:ngpiteapp/screens/login_page/login_page.dart';
import 'package:ngpiteapp/screens/login_page/login_page_logic.dart';

class StartPageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put(StartPageController());
  }
}

class StartPageController extends GetxController {
  final isConnectedPage = true.obs;
  final AuthRepositories = Get.find<ImpUsersRepositories>();
  final cache = Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;
  var appState = AppState.run.obs;

  startApp() async {
    if (await cache.getUserToken() == null) {
      Get.off(() => LoginPage(), binding: LoginPageBinding());
    } else {
      await checkToken();
    }
  }

  checkToken() async {
    loadingState.value = LoadingState.loading;
    final response = await AuthRepositories.checkToken();
    if (response.success) {
      if (response.data == "authenticated") {
        Get.put(CategoryPageController()).onInit();

        Get.off(() => CurvedNavigationBarCustom(),
            binding: CurvedNavigationBarBinding());
      } else {
        Get.off(() => LoginPage(), binding: LoginPageBinding());
      }
    } else {
      if (response.networkFailure!.code == 401)
        Get.off(() => LoginPage(), binding: LoginPageBinding());

      loadingState.value = LoadingState.hasError;
    }
  }
}
