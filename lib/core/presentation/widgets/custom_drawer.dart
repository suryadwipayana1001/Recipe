import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeai/core/core.dart';
import 'package:recipeai/core/presentation/providers/core_provider.dart';
import 'package:recipeai/features/favorite/presentations/pages/favorite_page.dart';

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
    return Consumer2<DrawerProvider, CoreProvider>(
        builder: (context, provider, coreProvider, _) {
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
                            appLoc.appBarName,
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
                          appLoc.myFavorite,
                          style: largeBoldTextStyle(),
                        ),
                        mediumVerticalSpacing(),
                        Column(
                          children: List.generate(
                            context.watch<CoreProvider>().recipeFavorite.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        if (widget.replacePage) {
                                          Navigator.pushReplacementNamed(
                                              context, FavoritePage.routeName,
                                              arguments: {
                                                "result": coreProvider
                                                        .recipeFavorite[index]
                                                    ['description']
                                              });
                                        } else {
                                          Navigator.pushNamed(
                                              context, FavoritePage.routeName,
                                              arguments: {
                                                "result": coreProvider
                                                        .recipeFavorite[index]
                                                    ['description']
                                              });
                                        }
                                      },
                                      child: Container(
                                        width: SizeConfig(context).appWidth(65),
                                        child: Text(
                                          coreProvider.recipeFavorite[index]
                                              ['title'],
                                          style: mediumNormalTextStyle(),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Icon(Icons.delete),
                                      onTap: () {
                                        coreProvider.deleteItem(coreProvider
                                            .recipeFavorite[index]['id']);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
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
