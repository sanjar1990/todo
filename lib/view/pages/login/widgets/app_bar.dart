import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_text.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onTap;
  const AppBarCustom({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ResColors.mainBackground,
        automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
     toolbarHeight: 130.h,
      title: GestureDetector(
          onTap: onTap,
        child: Container(
          height: 55.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h
          ),
          decoration: BoxDecoration(
            color: ResColors.white,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset('assets/icons/arrow_back.png'),
            ),
            CommonText(text: title, color: ResColors.primaryBlackText, size: 14.sp,fontWeight: FontWeight.w500,),
              Container(),
          ],),
        ),
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 70);
}
