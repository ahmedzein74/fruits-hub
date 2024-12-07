import 'package:flutter/material.dart';
import 'package:fruits_hub/core/functions/build_custom_app_bar.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best-selling';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        title: 'الاكثر مبيعا',
      ),
      body: const SafeArea(child: BestSellingViewBody()),
    );
  }
}
