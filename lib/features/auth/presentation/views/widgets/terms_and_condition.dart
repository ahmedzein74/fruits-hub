import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_check_box.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool isTermsAccept = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(0, -6),
          child: CustomCheckbox(
            onChecked: (value) {
              isTermsAccept = value;
              widget.onChanged(value);
              setState(() {});
            },
            isCheked: isTermsAccept,
          ),
        ),
        SizedBox(width: 16.w),
        SizedBox(
          width: 287.w,
          height: 44.h,
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: ' من خلال إنشاء حساب ، فإنك توافق على ',
                style: TextStyles.semiBold13
                    .copyWith(color: const Color(0xff949D9E))),
            TextSpan(
              text: ' الشروط والأحكام الخاصة بنا',
              style: TextStyles.semiBold13
                  .copyWith(color: ColorsManager.litePrimaryColor),
            )
          ])),
        )
      ],
    );
  }
}
