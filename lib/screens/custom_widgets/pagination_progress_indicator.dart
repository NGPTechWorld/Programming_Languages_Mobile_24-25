import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/config/color_manager.dart';
import 'package:ngpiteapp/app/config/values_manager.dart';

class PaginationProgressIndicator extends StatelessWidget {
  const PaginationProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.s10),
        Center(
          child: CircularProgressIndicator(
            color: ColorManager.firstColor,
          ),
        ),
        SizedBox(height: AppSize.s30),
      ],
    );
  }
}
