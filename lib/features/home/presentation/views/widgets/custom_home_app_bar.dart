import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        height: 34.h,
        width: 34.w,
        padding: const EdgeInsets.all(4),
        decoration: const ShapeDecoration(
          shape: OvalBorder(),
          color: Color(0xffEEF8ED),
        ),
        child: SvgPicture.asset(
          Assets.assetsImagesNotification,
        ),
      ),
      leading: Image.asset(Assets.assetsImagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: const Color(0xff949D9E)),
      ),
      subtitle: Text('احمد زين',
          style: TextStyles.bold16.copyWith(color: const Color(0xff0C0D0D))),
    );
  }
}
