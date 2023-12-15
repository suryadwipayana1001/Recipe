import 'package:flutter/material.dart';
import '../../core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.onTap,
      this.height = kToolbarHeight,
      this.title});
  final Function() onTap;
  final double height;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // leading: Padding(
      //   padding: EdgeInsets.symmetric(vertical: sizeExtraSmall),
      //   child: IconButton(
      //     onPressed: onTap,
      //     alignment: Alignment.center,
      //     icon: Icon(Icons.menu),
      //     color: black,
      //   ),
      // ),
      centerTitle: true,
      toolbarHeight: height,
      backgroundColor: white,
      leadingWidth: SizeConfig(context).appWidth(20),
      title: Text(
        title ?? appLoc.appName,
        style: largeBoldTextStyle(color: black),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
