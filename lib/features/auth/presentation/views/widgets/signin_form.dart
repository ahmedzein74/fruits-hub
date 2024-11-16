import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/functions/show_snack_bar.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/controller/signin_cubit/signin_cubit.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isPasswordVisible = true;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          buildSnackBar(context, 'تم تسجيل الدخول بنجاح');
        }
        if (state is SignInFailure) {
          buildSnackBar(context, state.message);
        }
        
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
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
                        }
                        else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                      text: 'تسجيل دخول'),
            ],
          ),
        );
      },
    );
  }
}
