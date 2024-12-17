import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildFormField extends StatelessWidget {
  final Icon image;
  final String hintText;
  final bool isPassword;
  final String labelName;
  final TextEditingController controller;

  const BuildFormField(
      {super.key,
      required this.controller,
      required this.image,
      required this.labelName,
      required this.hintText,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelName,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: ResColors.colorLoginPageText),
        ),
        SizedBox(height: 14.h),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25).w,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30).r,
            boxShadow: ResColors.shadowOne,
            color: Theme.of(context).colorScheme.primary,
          ),
          height: 70.h,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            obscureText: isPassword,
            controller: controller,
            style: Theme.of(context).textTheme.displayMedium,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              // contentPadding: const EdgeInsets.only(left: 12).w,
              prefixIcon: image,
              hintText: hintText,
            ),
          ),
        )
      ],
    );
  }
}
