import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:al_fatiha/view/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTitle extends StatelessWidget {
  const CreateTitle({super.key, required this.onChanged});
  final ValueChanged<String>onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText( text: 'Enter title:',),
          Container(
            // width: 328.w,
            height: 60.h,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: ResColors.white,

                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(width: 1, color: ResColors.borderColor)
            ),
            child:SizedBox(
              // width: 326.w,

              child:  TextField(
                  onChanged: onChanged,
                  onTapOutside: (value){
                    FocusScope.of(context).requestFocus( FocusNode());
                  },
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  decoration:   InputDecoration(
                      hintText: 'Enter title' ,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          color: ResColors.secondaryText
                      )
                  ),
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      color: ResColors.primaryBlackText
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
