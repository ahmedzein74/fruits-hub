import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:fruits_hub/core/widgets/custom_notification_widget.dart';

AppBar buildCustomAppBar(context, {required String title}) {
  return AppBar(
      leading: GestureDetector(
        child: const Icon(Icons.arrow_back_ios_new),
        onTap: () => Navigator.pop(context),
      ),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
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
