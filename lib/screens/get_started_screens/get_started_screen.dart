import 'package:carousel_slider/carousel_slider.dart';
import 'package:flight_x_plan/res/assets.dart';
import 'package:flight_x_plan/res/common_padding.dart';
import 'package:flight_x_plan/widgets/text_views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../animations/slide_right.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import 'get_started_provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
              decoration: const BoxDecoration(color: AppColors.xBackgroundColor
                  // image: DecorationImage(
                  //     image: AssetImage("assets/png/background_splash.png"),
                  //     fit: BoxFit.fill)
                  ),
              child: Column(
                children: [
                  CommonPadding.sizeBoxWithHeight(height: 78),
                  Center(
                    child: Image.asset(
                      "assets/png/get_started_logo@2x.png",
                      height: sizes!.heightRatio * 66,
                      width: sizes!.widthRatio * 102,
                    ),
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 33),
                  Center(
                      child: TextView.getTextWith20(
                          "WELCOME TO FLIGHT X PLAN", Assets.sourceSansProBold,
                          color: AppColors.xFontText, lines: 1)),
                  CommonPadding.sizeBoxWithHeight(height: 59),
                  // Center(
                  //     child: Image.asset(
                  //   "assets/png/get_started_plane@2x.png",
                  //   height: sizes!.heightRatio * 335,
                  //   width: sizes!.widthRatio * 250,
                  // )),

                  CarouselSlider(
                    options: CarouselOptions(
                        height: 400.0,
                      enlargeCenterPage: true,

                    ),
                    items: [1,2,3,4,5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              // width: MediaQuery.of(context).size.width,
                              // margin: const EdgeInsets.symmetric(horizontal: 0.0),
                              decoration:  BoxDecoration(
                                  color: Colors.amber,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(child: Text('text $i', style: const TextStyle(fontSize: 16.0),))
                          );
                        },
                      );
                    }).toList(),
                  ),




                  // Container(
                  //   height: sizes!.heightRatio * 50,
                  //   width: sizes!.widthRatio * 195,
                  //   decoration: BoxDecoration(
                  //       color: AppColors.xBackgroundColor,
                  //       borderRadius: BorderRadius.circular(31),
                  //       border: Border.all(
                  //         color: AppColors.xFontText,
                  //       )),
                  //   child: Center(
                  //       child: TextView.getTextWith20(
                  //           "Sign in", Assets.sourceSansProSemiBold,
                  //           color: AppColors.xFontText, lines: 1)),
                  // )
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
