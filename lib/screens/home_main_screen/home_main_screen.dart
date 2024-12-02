import 'package:flutter/material.dart';
import '/app/config/color_manager.dart';

class HomeMainScreen extends StatelessWidget {
  HomeMainScreen({super.key});
  final s = ["mohamd", "dddd"];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
