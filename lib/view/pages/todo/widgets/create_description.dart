import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:al_fatiha/view/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateDescription extends StatelessWidget {
  const CreateDescription({super.key, required this.onChanged});
  final ValueChanged<String>onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      margin: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(text: 'Description:',),
          Container(
            // width: 328.w,
              height: 140.h,
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                    width: 1,
                    color: ResColors.borderColor),
              ),
              child: TextFormField(
                textCapitalization: TextCapitalization.sentences,
                // controller: controller,
                minLines: 6,

                // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,

                onChanged: onChanged,
                onTapOutside: (value){
                  FocusScope.of(context).requestFocus( FocusNode());
                },
                decoration:  InputDecoration(
                  hintText: 'No description',
                    hintStyle: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        color: ResColors.secondaryText
                    ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),

                style: TextStyle(
                    color: ResColors.primaryBlackText,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
              )),
        ],
      ),
    );
  }
}
