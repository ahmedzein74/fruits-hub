import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:svg_flutter/svg.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * .9,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: AspectRatio(
        aspectRatio: 342 / 152,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                right: width * .4,
                child: SvgPicture.asset(Assets.assetsImagesPageViewItem2Image,
                    fit: BoxFit.fill)),
            Container(
              width: width * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: svg.Svg(Assets.assetsImagesFeaturedItemBackground),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.h),
                    Text(
                      'عروض العيد',
                      style: TextStyles.regular13.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'خصم 25%  ',
                      style: TextStyles.bold19.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    FeaturedItemButton(onPressed: () {}),
                    SizedBox(
                      height: 29.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
