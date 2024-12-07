import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/best_selling_view.dart';

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
          onTap: () {
            Navigator.pushNamed(context, BestSellingView.routeName);
          },
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
