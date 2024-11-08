import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_view.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.title,
      required this.subtitle,
      required this.isVisible});
  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                backgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SvgPicture.asset(image),
            ),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, LoginView.routeName);
                  },
                  child: Text(
                    'تخط',
                    style: TextStyles.regular13
                        .copyWith(color: const Color(0xff949D9E)),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 64.h),
        title,
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style:
                TextStyles.semiBold13.copyWith(color: const Color(0xff4E5556)),
          ),
        ),
      ],
    );
  }
}
