import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/utils/colors.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          image: Assets.assetsImagesPageViewItem1Image,
          backgroundImage: Assets.assetsImagesPageViewItem1Background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحبًا بك فى',
                style: TextStyles.bold23,
              ),
              Text(
                ' HUB',
                style: TextStyles.bold23
                    .copyWith(color: ColorsManager.secondaryColor),
              ),
              Text(
                ' Fruit',
                style: TextStyles.bold23
                    .copyWith(color: ColorsManager.primaryColor),
              ),
            ],
          ),
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        PageViewItem(
          isVisible: false,
          image: Assets.assetsImagesPageViewItem2Image,
          backgroundImage: Assets.assetsImagesPageViewItem2Background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ابحث وتسوق',
                style: TextStyles.bold23,
              )
            ],
          ),
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        ),
      ],
    );
  }
}
