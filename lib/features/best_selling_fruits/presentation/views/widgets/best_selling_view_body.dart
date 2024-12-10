import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_silling_grid_view.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 24.0.h, bottom: 8.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'الأكثر مبيعًا',
                  style: TextStyles.bold16
                      .copyWith(color: const Color(0xff0C0D0D)),
                ),
              ],
            ),
          ),
        ),
        const BestSillingGridView(),
      ],
    );
  }
}
