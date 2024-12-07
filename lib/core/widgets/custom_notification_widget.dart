import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
