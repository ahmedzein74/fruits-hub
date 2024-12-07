import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/widgets/custom_notification_widget.dart';

AppBar buildCustomAppBar({required String title}) {
  return AppBar(
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomNotification(),
        )
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: TextStyles.bold19.copyWith(color: Colors.black),
      ));
}
