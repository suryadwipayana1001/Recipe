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
          automaticallyImplyLeading: true,
          bgColor: white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(sizeMedium),
              child: Form(
                key: provider.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(sizeLarge),
                      child: Text(
                        appLoc.ingredients,
                        style: largeBoldTextStyle(),
                      ),
                    ),
                    largeVerticalSpacing(),
                    CustomTextField(
                      hintText: appLoc.example,
                      maxLines: 7,
                      controller: provider.ingredientsController,
                      fieldValidator: ValidationHelper(
                        requiredMessage: appLoc.fieldRequired,
                        loc: appLoc,
                        isError: (error) =>
                            provider.setIngredientsError = error,
                        typeField: TypeField.none,
                      ).validate(),
                    ),
                    largeVerticalSpacing(),
                    CustomButton(
                      width: SizeConfig(context).appWidth(100),
                      text: appLoc.generateReceipt,
                      onPressed: () {
                        if (provider.formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, ResultPage.routeName);
                        }
                      },
                    ),
                    largeVerticalSpacing(),
                    Image.asset(healtyOptions)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
