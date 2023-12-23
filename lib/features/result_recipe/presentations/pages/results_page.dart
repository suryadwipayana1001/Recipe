import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeai/features/result_recipe/domain/usecase/result_usecase.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/core.dart';
import '../../../../core/presentation/providers/core_provider.dart';
import '../../../../core/presentation/providers/result_state.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});
  static const String routeName = '/result';

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ResultState>(
      stream: context.read<CoreProvider>().fetch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.runtimeType) {
            case ResultLoading:
              return CustomLoading();
            case ResultSuccess:
              return AppContainer(
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
                                              Share.share(
                                                  context
                                                      .read<CoreProvider>()
                                                      .result
                                                      .toString(),
                                                  subject: 'RecipeAI');
                                            },
                                            child: Icon(Icons.share)),
                                        smallHorizontalSpacing(),
                                        GestureDetector(
                                          onTap: () async {
                                            final coreProvider =
                                                context.read<CoreProvider>();
                                            showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              elevation: 5,
                                              isScrollControlled: true,
                                              builder: (_) => Container(
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: Icon(
                                                          Icons.close,
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        appLoc.saveRecipe,
                                                        style:
                                                            largeBoldTextStyle(),
                                                      ),
                                                    ),
                                                    largeVerticalSpacing(),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal:
                                                              sizeMedium),
                                                      child: CustomTextField(
                                                        title:
                                                            appLoc.recipeTitle,
                                                        controller: coreProvider
                                                            .titleHistoryController,
                                                        hintText:
                                                            appLoc.enterRecipe,
                                                      ),
                                                    ),
                                                    largeVerticalSpacing(),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal:
                                                              sizeMedium),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: CustomButton(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                10.0),
                                                          ),
                                                          width: 100,
                                                          height: 40,
                                                          onPressed: () async {
                                                            await coreProvider
                                                                .addFavorite();
                                                            coreProvider
                                                                .titleHistoryController
                                                                .text = '';
                                                            if (!mounted)
                                                              return;
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          text: appLoc.save,
                                                        ),
                                                      ),
                                                    ),
                                                    largeVerticalSpacing(),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Icon(Icons.bookmark_border),
                                        ),
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
                                context.watch<CoreProvider>().result.toString(),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                              textStyle: buttonTextStyle(color: buttonColor),
                              elevation: 0.0,
                              backgroundColor: white,
                              width: 130,
                              height: 45,
                              circular: 10,
                              text: appLoc.back,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          CustomButton(
                            width: 130,
                            height: 45,
                            circular: 10,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                            text: appLoc.reload,
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, ResultPage.routeName);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case ResultFailure:
              return CustomError(text: appLoc.tryMoment);
          }
        }
        return CustomError(text: appLoc.noInternet);
      },
    );
  }
}
