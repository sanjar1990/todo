import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:al_fatiha/view/pages/login/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          top: 60.h
        ),
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
    );
  }
}
