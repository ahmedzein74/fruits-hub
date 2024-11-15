import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_signin_button.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
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
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                'نسيت كلمة المرور؟',
                style: TextStyles.semiBold13
                    .copyWith(color: ColorsManager.litePrimaryColor),
              ),
            ),
            SizedBox(height: 33.h),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            SizedBox(height: 33.h),
            const DontHaveAnAccountWidget(),
            SizedBox(height: 33.h),
            const OrDivider(),
            SizedBox(height: 16.h),
            SocialSignInButton(
              label: 'تسجيل بواسطة جوجل',
              image: Assets.assetsImagesGoogleIcon,
              onPress: () {},
            ),
            SizedBox(height: 16.h),
            SocialSignInButton(
              label: 'تسجيل بواسطة أبل',
              image: Assets.assetsImagesAppleIcon,
              onPress: () {},
            ),
            SizedBox(height: 16.h),
            SocialSignInButton(
              label: 'تسجيل بواسطة فيسبوك',
              image: Assets.assetsImagesFacebookIcon,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
