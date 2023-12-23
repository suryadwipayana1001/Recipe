import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/core.dart';

class FavoritePage extends StatefulWidget {
  String result;
  FavoritePage({super.key, required this.result});
  static const String routeName = '/favorite';

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      replacePage: true,
      bgColor: white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Material(
                    color: white,
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(sizeLarge),
                      child: Column(
                        children: [
                          Image.asset(femaleChef),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  appLoc.recommendation,
                                  textAlign: TextAlign.center,
                                  style: largeBoldTextStyle(),
                                ),
                              ),
                              smallHorizontalSpacing(),
                              GestureDetector(
                                  onTap: () {
                                    Share.share(widget.result.toString(),
                                        subject: 'RecipeAI');
                                  },
                                  child: Icon(Icons.share)),
                              smallHorizontalSpacing(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  mediumVerticalSpacing(),
                  Padding(
                    padding: const EdgeInsets.all(sizeMedium),
                    child: Text(
                      widget.result,
                      style: mediumNormalTextStyle(),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: sizeLarge, vertical: sizeMedium),
            child: CustomButton(
                width: SizeConfig(context).appWidth(100),
                text: appLoc.back,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
