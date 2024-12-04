import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/widgets/fruit_item.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_heading.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_silling_grid_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                const CustomHomeAppBar(),
                SizedBox(
                  height: 16.h,
                ),
                const SearchTextField(),
                SizedBox(height: 12.h),
                const FeaturedList(),
                SizedBox(height: 12.h),
                const BestSellingHeading(),
                SizedBox(height: 8.h),
              ],
            ),
          ),
          const BestSillingGridView()
        ],
      ),
    );
  }
}
