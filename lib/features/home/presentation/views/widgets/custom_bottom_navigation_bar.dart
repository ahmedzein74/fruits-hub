import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 75,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r)),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              spreadRadius: 0,
              blurRadius: 30,
              offset: Offset(0, -2), // changes position of shadow
            )
          ]),
    );
  }
}
