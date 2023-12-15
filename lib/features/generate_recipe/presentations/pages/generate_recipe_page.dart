import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeai/core/presentation/providers/core_provider.dart';
import 'package:recipeai/features/result_recipe/presentations/pages/results_page.dart';
import '../../../../core/core.dart';

class GenerateRecipePage extends StatefulWidget {
  const GenerateRecipePage({super.key});
  static const String routeName = '/generateRecipe';
  @override
  State<GenerateRecipePage> createState() => _GenerateRecipePageState();
}

class _GenerateRecipePageState extends State<GenerateRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoreProvider>(
      builder: (context, provider, _) {
        return AppContainer(
          bgColor: primaryColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(sizeMedium),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(bgIngredients),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(sizeLarge),
                      child: Text(
                        appLoc.ingredients,
                        style: largeBoldTextStyle(),
                      ),
                    ),
                  ),
                  largeVerticalSpacing(),
                  CustomTextField(
                    maxLines: 7,
                    controller: provider.ingredientsController,
                  ),
                  largeVerticalSpacing(),
                  CustomButton(
                    width: SizeConfig(context).appWidth(100),
                    text: appLoc.generateReceipt,
                    onPressed: () {
                      Navigator.pushNamed(context, ResultPage.routeName);
                    },
                  ),
                  largeVerticalSpacing(),
                  Image.asset(healtyOptions)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
