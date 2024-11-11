import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_condition.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            const CustomTextFormField(
              hintText: '  الاسم كامل',
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 16.h),
            const CustomTextFormField(
              hintText: 'البريد  الالكترونى',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.h),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
            ),
            SizedBox(height: 16.h),
            const TermsAndCondition(),
            SizedBox(height: 30.h),
            CustomButton(onPressed: () {}, text: 'إنشاء حساب جديد'),
            SizedBox(height: 26.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'تمتلك حساب بالفعل؟',
                      style: TextStyles.semiBold16
                          .copyWith(color: const Color(0xff949D9E))),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
                      },
                    text: ' تسجيل دخول',
                    style: TextStyles.semiBold16
                        .copyWith(color: ColorsManager.primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
