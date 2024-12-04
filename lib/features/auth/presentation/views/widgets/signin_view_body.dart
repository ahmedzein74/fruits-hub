import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/functions/show_snack_bar.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/controller/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_signin_button.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';

import 'or_divider.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isPasswordVisible = true;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          if (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified) {
            buildSnackBar(context, 'تم تسجيل الدخول بنجاح');
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          } else {
            buildSnackBar(context, 'يرجى التحقق من بريدك الالكترونى');
          }
        } else if (state is SignInFailure) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال البريد الالكترونى';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                    hintText: 'البريد  الالكترونى',
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال كلمة المرور';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                    isPassword: isPasswordVisible,
                    hintText: 'كلمة المرور',
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon: isPasswordVisible
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye,
                                color: Color(0xffC9CECF)),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            icon: const Icon(Icons.visibility_off,
                                color: Color(0xffC9CECF)),
                          ),
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
                  state is SignInLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.primaryColor,
                          ),
                        )
                      : CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              context
                                  .read<SignInCubit>()
                                  .signInWithEmailAndPassword(email, password);
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                          text: 'تسجيل دخول',
                        ),
                  SizedBox(height: 33.h),
                  const DontHaveAnAccountWidget(),
                  SizedBox(height: 33.h),
                  const OrDivider(),
                  SizedBox(height: 16.h),
                  SocialSignInButton(
                    label: 'تسجيل بواسطة جوجل',
                    image: Assets.assetsImagesGoogleIcon,
                    onPress: () {
                      context.read<SignInCubit>().signInWithGoogle();
                    },
                  ),
                  Platform.isIOS
                      ? Column(
                          children: [
                            SizedBox(height: 16.h),
                            SocialSignInButton(
                              label: 'تسجيل بواسطة أبل',
                              image: Assets.assetsImagesAppleIcon,
                              onPress: () {},
                            )
                          ],
                        )
                      : const SizedBox(),
                  SizedBox(height: 16.h),
                  SocialSignInButton(
                    label: 'تسجيل بواسطة فيسبوك',
                    image: Assets.assetsImagesFacebookIcon,
                    onPress: () {
                      context.read<SignInCubit>().signInWithFacebook();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
