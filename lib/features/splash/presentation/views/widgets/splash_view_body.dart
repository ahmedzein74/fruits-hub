import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.assetsImagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
            Assets.assetsImagesSplashBottom,
            fit: BoxFit.fill,
          ),
        ),
      ]),
    );
  }
}
