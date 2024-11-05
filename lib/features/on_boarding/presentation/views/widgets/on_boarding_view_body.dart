import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: OnBoardingPageView(),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeSize: Size(11.w, 11.h),
              size: Size(11.w, 11.h),
              activeColor: ColorsManager.primaryColor,
              color: ColorsManager.primaryColor.withOpacity(0.5)),
        ),
        SizedBox(height: 29.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: CustomButton(onPressed: () {}, text: 'ابدأ الان'),
        ),
        SizedBox(height: 43.h),
      ],
    );
  }
}
