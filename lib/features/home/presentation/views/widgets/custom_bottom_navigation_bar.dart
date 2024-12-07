import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
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
          ],
        ),
        child: Row(
          children: bottomNavigationList.asMap().entries.map((e) {
            var index = e.key;
            var entity = e.value;
            return Expanded(
              flex: index == currentIndex ? 3 : 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: NavigationBarItem(
                  bottomNavigationBarEntity: entity,
                  isActive: index == currentIndex,
                ),
              ),
            );
          }).toList(),
        ));
  }
}
