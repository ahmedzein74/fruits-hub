import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: ColorsManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
