import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:al_fatiha/view/pages/login/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendRecordedAudio extends StatelessWidget {
  const SendRecordedAudio(
      {super.key, required this.playTap, required this.sendAudioTap, required this.deleteTap,
        required this.isPlaying,});

  final VoidCallback playTap;
  final VoidCallback sendAudioTap;
  final VoidCallback deleteTap;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

          color: ResColors.backgroundColor,
          borderRadius: BorderRadius.circular(22)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //play
          GestureDetector(
            onTap: playTap,
            child: SizedBox(
              width: 64.w,
              height: 64.h,
              child: CircleAvatar(
                backgroundColor: ResColors.mainBackground,
                child: Center(child: SizedBox(
                  width: 24,
                  height: 24,
                  child: isPlaying ? Image.asset(
                      'assets/icons/stop_icon.png')
                      : Image.asset(
                      'assets/icons/play_icon.png'),
                ),),
              ),
            ),
          ),
          //send audio
          GestureDetector(
            onTap: sendAudioTap,
            child: Container(
              width: 220.w,
              height: 64.h,
              decoration: BoxDecoration(
                  color: ResColors.primaryColor,
                  borderRadius: BorderRadius.circular(64)
              ),
              child: Center(
                child: CommonText(text: 'Yuborish',
                  color: ResColors.white,
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          //delete audio
          GestureDetector(
            onTap: deleteTap,
            child: SizedBox(
              width: 64.w,
              height: 64.h,
              child: CircleAvatar(
                backgroundColor: ResColors.mainBackground,
                child: Center(child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/icons/delete_icon.png')),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
