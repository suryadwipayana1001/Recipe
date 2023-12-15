import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeai/core/core.dart';

import '../providers/drawer_provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key, this.replacePage = false});
  final bool replacePage;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(builder: (context, provider, _) {
      return SafeArea(
        child: Drawer(
          backgroundColor: primaryColor,
          width: SizeConfig(context).appWidth(85),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig(context).appWidth(85),
                height: SizeConfig(context).appHeight(8),
                color: secondaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: paddingsizeMedium,
                      vertical: paddingsizeSmall),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appLoc.appName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: largeBoldTextStyle(color: white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: paddingsizeMedium,
                        vertical: paddingsizeSmall),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mediumVerticalSpacing(),
                        Text(
                          appLoc.history,
                          style: largeBoldTextStyle(),
                        ),
                        mediumVerticalSpacing()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
