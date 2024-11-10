import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.isCheked,
    required this.onChecked,
  });

  final bool isCheked;
  final ValueChanged<bool> onChecked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isCheked);
      },
      child: AnimatedContainer(
          width: 24.w,
          height: 24.h,
          duration: const Duration(milliseconds: 300),
          decoration: ShapeDecoration(
            color: isCheked ? ColorsManager.primaryColor : Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color:
                      isCheked ? Colors.transparent : const Color(0xffDDDFDF),
                  width: 1.5.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: isCheked
              ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SvgPicture.asset(Assets.assetsImagesCheck),
                )
              : null),
    );
  }
}
