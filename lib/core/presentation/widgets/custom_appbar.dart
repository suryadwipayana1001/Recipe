import 'package:flutter/material.dart';
import '../../core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.onTap,
    this.height = kToolbarHeight,
    this.title,
    this.automaticallyImplyLeading = false,
  });
  final Function() onTap;
  final double height;
  final String? title;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // leading: automaticallyImplyLeading
      //     ? Center(
      //         child: IconButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           icon: Icon(
      //             Icons.arrow_back_ios_new,
      //             color: black,
      //           ),
      //         ),
      //       )
      //     : SizedBox(),
      elevation: 3,
      leading: Padding(
        padding: EdgeInsets.symmetric(vertical: sizeExtraSmall),
        child: IconButton(
          onPressed: onTap,
          alignment: Alignment.center,
          icon: Icon(Icons.menu),
          color: black,
        ),
      ),
      centerTitle: true,
      toolbarHeight: height,
      backgroundColor: white,
      leadingWidth: SizeConfig(context).appWidth(20),
      title: Text(
        title ?? appLoc.appBarName,
        style: largeBoldTextStyle(color: black),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
