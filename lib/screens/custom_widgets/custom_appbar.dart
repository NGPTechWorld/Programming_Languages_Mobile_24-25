import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key , 
  required this.title , 
  this.leading,
  this.centerTitle
  }) : super(key: key);
  final Widget? title;
  final Widget? leading;
  final bool? centerTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:title, 
      leading: leading ,
      centerTitle: centerTitle,
    );
  }

  // Implement preferredSize to specify the height of the AppBar
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}