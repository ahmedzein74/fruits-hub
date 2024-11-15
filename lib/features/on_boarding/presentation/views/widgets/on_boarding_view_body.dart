import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/constant.dart';
import 'package:fruits_hub/core/services/shared_preferences.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeSize: Size(11.w, 11.h),
              size: Size(11.w, 11.h),
              activeColor: ColorsManager.primaryColor,
              color: currentIndex == 1
                  ? ColorsManager.primaryColor
                  : ColorsManager.primaryColor.withOpacity(0.5)),
        ),
        SizedBox(height: 29.h),
        Visibility(
          visible: currentIndex == 1 ? true : false,
          maintainState: true,
          maintainSize: true,
          maintainAnimation: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: CustomButton(
                onPressed: () {
                  SharedPreferencesService.setBool(kIsOnBoardingSeen, true);
                  Navigator.pushReplacementNamed(context, SigninView.routeName);
                },
                text: 'ابدأ الان'),
          ),
        ),
        SizedBox(height: 43.h),
      ],
    );
  }
}
