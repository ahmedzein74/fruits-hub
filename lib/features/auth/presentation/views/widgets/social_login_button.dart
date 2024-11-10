import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.label,
    required this.image,
    required this.onPress,
  });

  final String label;
  final String image;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xffdcdede), width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
          ),
        ),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 60.w),
            Text(
              label,
              style: TextStyles.semiBold16,
            ),
          ],
        ),
      ),
    );
  }
}
