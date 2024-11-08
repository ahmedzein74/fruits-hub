import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';

AppBar buildAppBar({context, required String title}) {
  return AppBar(
    leading: GestureDetector(
      child: const Icon(Icons.arrow_back_ios_new),
      onTap: () => Navigator.pop(context),
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.bold19,
      textAlign: TextAlign.center,
    ),
  );
}
