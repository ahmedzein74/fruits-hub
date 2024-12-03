import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styels.dart';
import 'package:svg_flutter/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0x0a000000).withOpacity(.1),
          spreadRadius: 0,
          blurRadius: 9,
          offset: const Offset(0, 2), // changes position of shadow
        )
      ]),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              Assets.assetsImagesSearch,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(Assets.assetsImagesSearchFilter),
          ),

          hintText: 'ابحث عن.......',
          hintStyle: TextStyles.regular13.copyWith(
            color: const Color(0xff949D9E),
          ),
          filled: true,
          fillColor: const Color(0xffffffff),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          // focusedErrorBorder: buildErrorBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: const Color(0xffffffff),
        width: .6.w,
      ),
    );
  }
}
