import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/utils/colors.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xfff3f5f7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_sharp)),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 19.5.w),
                  child: Image.asset(
                    Assets.assetsImagesWatermelonTest,
                  ),
                ),
                SizedBox(height: 24.h),
                ListTile(
                  title: Text(
                    'بطيخ',
                    style: TextStyles.semiBold16.copyWith(color: Colors.black),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '30 جنيه ',
                            style: TextStyles.bold13
                                .copyWith(color: ColorsManager.secondaryColor)),
                        TextSpan(
                            text: '/',
                            style: TextStyles.semiBold13.copyWith(
                                color: ColorsManager.liteSecondaryColor)),
                        TextSpan(
                            text: 'كيلو',
                            style: TextStyles.semiBold13.copyWith(
                                color: ColorsManager.liteSecondaryColor)),
                      ],
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: ColorsManager.primaryColor,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
