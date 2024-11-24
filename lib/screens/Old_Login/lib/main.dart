import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/screens/forgot_password/forgot_password.dart';
import 'package:shop_app/screens/login_success/login_success.dart'; 
import 'package:shop_app/screens/sign_in/sign_in.dart';
import 'package:shop_app/screens/splash/splash.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  SizeConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      theme: theme(),
      home:const SplashScreen(),
      getPages: [
        GetPage(name: SplashScreen.route, page: ()=> const SplashScreen()),
        GetPage(name: SignInScreen.route, page: () =>  const SignInScreen(),),
        GetPage(name: ForgotPasswordScreen.route, page: () =>  const ForgotPasswordScreen(),),
        GetPage(name: LoginSuccessScreen.route, page: () =>  const LoginSuccessScreen(),)
      ],
    );
  }
}
