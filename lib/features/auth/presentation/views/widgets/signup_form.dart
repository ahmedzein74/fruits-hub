import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/functions/show_snack_bar.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/controller/signup_cubit/signup_cubit.dart';

import 'terms_and_condition.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  bool isPasswordVisible = true;
  late bool isTermsAccept = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          buildSnackBar(
              context, ' تم التسجيل بنجاح قم بتاكيد البريد الالكترونى');
        }
        if (state is SignUpFailure) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال الاسم';
                  } else if (value.length < 3) {
                    return 'يجب أن يحتوي الاسم على ثلاثة أحرف على الأقل';
                  }
                  return null;
                },
                hintText: '  الاسم كامل',
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال البريد الالكترونى';
                  }
                  return null;
                },
                hintText: 'البريد  الالكترونى',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                isPassword: isPasswordVisible,
                onSaved: (value) {
                  password = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال كلمه المرور';
                  }
                  return null;
                },
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: isPasswordVisible
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: Color(0xffC9CECF),
                        ))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: const Icon(
                          Icons.visibility_off,
                          color: Color(0xffC9CECF),
                        )),
              ),
              SizedBox(height: 16.h),
              TermsAndCondition(
                onChanged: (value) {
                  isTermsAccept = value;
                  setState(() {});
                },
              ),
              SizedBox(height: 30.h),
              state is SignUpLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ColorsManager.primaryColor,
                    ))
                  : CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (isTermsAccept) {
                            context
                                .read<SignUpCubit>()
                                .createUserWithEmailAndPassword(
                                    email, password, name);
                          } else {
                            buildSnackBar(context, 'يرجى قبول الشروط والاحكام');
                          }
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      text: 'إنشاء حساب جديد'),
            ],
          ),
        );
      },
    );
  }
}
