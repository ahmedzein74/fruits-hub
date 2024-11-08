import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h, // حدد الارتفاع الذي تريده هنا
      child: TextFormField(
        keyboardType: textInputType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
          hintText: hintText,
          hintStyle: TextStyles.bold13.copyWith(
            color: const Color(0xff949e9d),
          ),
          filled: true,
          fillColor: const Color(0xfff9fafa),
          border: buildBorder(),
          enabledBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(
        color: Color(0xFFe6e9e9),
        width: 2,
      ),
    );
  }
}
