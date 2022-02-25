import 'package:flight_x_plan/res/assets.dart';
import 'package:flight_x_plan/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../animations/slide_right.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import 'get_started_provider.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>
    with SingleTickerProviderStateMixin {
  late GetStartedProvider getStartedProvider;

  @override
  void initState() {
    super.initState();
    getStartedProvider = GetStartedProvider();
    getStartedProvider =
        Provider.of<GetStartedProvider>(context, listen: false);
    getStartedProvider.init(context: context);
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    Provider.of<GetStartedProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
              height: sizes!.height,
              width: sizes!.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/png/background_splash.png"),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  TextView.getTextWith20(
                      "Hello- Flight X Plan", Assets.poppinsMedium,
                      color: AppColors.redColor, lines: 1)
                ],
              )),
        ),
      ),
    );
  }

  void moveToRegisterAsScreen() async {
    // Navigator.pushReplacement(
    //     context, SlideRightRoute(page: const RegisterAsScreen()));
  }
}
