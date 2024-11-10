import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: 'حساب جديد', context: context),
        body: const SignUpViewBody());
  }
}
