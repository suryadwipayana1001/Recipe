import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                                    Text(
                                      appLoc.recommendation,
                                      style: largeBoldTextStyle(),
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
                      padding: const EdgeInsets.all(sizeMedium),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                              textStyle: buttonTextStyle(color: buttonColor),
                              elevation: 0.0,
                              backgroundColor: white,
                              width: 130,
                              height: 40,
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
                            height: 40,
                            circular: 10,
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
              return CustomError();
          }
        }
        return const SizedBox();
      },
    );
  }
}
