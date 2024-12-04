import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            4,
            (index) => Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: const FeaturedItem(),
                )),
      ),
    );
  }
}
