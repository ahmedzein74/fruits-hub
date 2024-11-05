import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/main.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.title,
      required this.subtitle});
  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                backgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SvgPicture.asset(image),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('تخط'),
            ),
          ],
        ),
        SizedBox(height: 64.h),
        title,
        SizedBox(height: 24.h),
        Text(
          subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
