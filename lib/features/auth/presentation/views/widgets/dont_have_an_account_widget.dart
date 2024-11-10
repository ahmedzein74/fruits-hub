import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:fruits_hub/features/auth/presentation/views/signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب ؟ ',
            style:
                TextStyles.semiBold16.copyWith(color: const Color(0xff949D9E)),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignUpView.routeName);
              },
            text: ' قم بإنشاء حساب',
            style: TextStyles.semiBold16
                .copyWith(color: ColorsManager.primaryColor),
          ),
        ],
      ),
    );
  }
}
