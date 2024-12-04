import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/utils/colors.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: 116.w,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            )),
        onPressed: onPressed,
        child: Text(
          'تسوق الان',
          style: TextStyles.bold13.copyWith(color: ColorsManager.primaryColor),
        ),
      ),
    );
  }
}
