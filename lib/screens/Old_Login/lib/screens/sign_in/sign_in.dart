import 'package:flutter/material.dart';
import './components/body.dart';
class SignInScreen extends StatelessWidget {
  static const route = "/sign_in";
  
   const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.white,
        title: const Text('Sign In'),
      ),
      body: Body(),
    );
  }
}