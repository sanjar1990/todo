import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordButton extends StatelessWidget {
  const RecordButton({super.key, required this.imagePath, required this.onTap});
  final String imagePath;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
      child: SizedBox(
        width: 88.w,
        height: 88.h,
        child: CircleAvatar(
          backgroundColor: ResColors.primaryColor,
          child: Center(
            child: Container(
              width: 24.w,
              height: 24.h,
              child: Image.asset('assets/icons/$imagePath'),
            ),
          ),
        ),
      ),
    );
  }
}
