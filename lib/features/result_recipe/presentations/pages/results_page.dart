import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';
import '../../../../core/presentation/providers/core_provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});
  static const String routeName = '/result';

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoreProvider>(
      builder: (context, provider, _) {
        return AppContainer(
          bgColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.all(sizeMedium),
            child: Column(
              children: [
                Material(
                  elevation: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(bgIngredients),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(sizeLarge),
                      child: Column(
                        children: [
                          Image.asset(femaleChef),
                          Text(
                            appLoc.recommendation,
                            style: largeBoldTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                largeVerticalSpacing(),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(sizeMedium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                    width: 120,
                    height: 40,
                    circular: 10,
                    text: appLoc.back,
                    onPressed: () {}),
                CustomButton(
                    width: 120,
                    height: 40,
                    circular: 10,
                    text: appLoc.reload,
                    onPressed: () {})
              ],
            ),
          ),
        );
      },
    );
  }
}
