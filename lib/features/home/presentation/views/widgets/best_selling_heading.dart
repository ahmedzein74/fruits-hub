import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';

class BestSellingHeading extends StatelessWidget {
  const BestSellingHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الأكثر مبيعًا',
          style: TextStyles.bold16.copyWith(color: const Color(0xff0C0D0D)),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            ' المزيد',
            style:
                TextStyles.regular13.copyWith(color: const Color(0xff949D9E)),
          ),
        ),
      ],
    );
  }
}
