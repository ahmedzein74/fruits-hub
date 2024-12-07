import 'package:fruits_hub/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inactiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inactiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationList => [
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesVuesaxBoldHome,
          inactiveImage: Assets.assetsImagesVuesaxOutlineHome,
          name: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesVuesaxBoldProudcts,
          inactiveImage: Assets.assetsImagesVuesaxOutlineProudcts,
          name: 'المنتجات'),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesVuesaxBoldShoppingCart,
          inactiveImage: Assets.assetsImagesVuesaxOutlineShoppingCart,
          name: 'سله التسوق'),
      BottomNavigationBarEntity(
          activeImage: Assets.assetsImagesVuesaxBoldUser,
          inactiveImage: Assets.assetsImagesVuesaxOutlineUser,
          name: 'حسابي'),
    ];
