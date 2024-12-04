import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/widgets/fruit_item.dart';

class BestSillingGridView extends StatelessWidget {
  const BestSillingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 163.w / 214.h,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const FruitItem();
        });
  }
}
