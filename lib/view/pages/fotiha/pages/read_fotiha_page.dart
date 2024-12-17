import 'package:al_fatiha/data/tools/strings/string.dart';
import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:al_fatiha/view/pages/fotiha/controller/fotiha_controller.dart';
import 'package:al_fatiha/view/pages/fotiha/widgets/record_button.dart';
import 'package:al_fatiha/view/pages/fotiha/widgets/send_recorded_audio.dart';
import 'package:al_fatiha/view/pages/login/widgets/common_text.dart';
import 'package:al_fatiha/view/widgets/common_app_bar.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';

class ReadFotihaPage extends StatefulWidget {
  const ReadFotihaPage({super.key});

  @override
  State<ReadFotihaPage> createState() => _ReadFotihaPageState();
}

class _ReadFotihaPageState extends State<ReadFotihaPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FotihaController>(
      init: FotihaController(),
      builder: (controller) => Scaffold(
        // appBar:  AppBarCustom(title: Strings.fotihaSurasi.tr, onTap: (){Get.back();},),
        backgroundColor: ResColors.mainBackground,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: CommonAppBar(
                    title: Strings.fotihaSurasi.tr,
                    onTap: () {
                      Get.back();
                    },
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 450.h,
                width: 343.w,
                child: Image.asset('assets/images/fotiha_photo.png'),
              ),
              if (controller.recordedAudio == null &&
                  !controller.recorder.isRecording)
                Container(
                  width: 280.w,
                  margin: EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      Text(
                        controller.readRuleOne,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ResColors.primaryBlackText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CommonText(
                        text: controller.readRuleTwo,
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: ResColors.greyText,
                      )
                    ],
                  ),
                ),
              controller.recorder.isRecording
                  ? Container(
                      margin: EdgeInsets.only(top: 22, bottom: 22),
                      child: StreamBuilder<RecordingDisposition>(
                          stream: controller.recorder.onProgress,
                          builder: (context, snapshot) {
                            final duration = snapshot.hasData
                                ? snapshot.data!.duration
                                : Duration.zero;
                            String twoDigits(int n) => n.toString().padLeft(3);
                            controller.twoDigitMinutes =
                                twoDigits(duration.inMinutes.remainder(60));
                            controller.twoDigitSecond =
                                twoDigits(duration.inSeconds.remainder(60));
                            return Text(
                              '${controller.twoDigitMinutes} :${controller.twoDigitSecond}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: ResColors.primaryBlackText),
                            );
                          }),
                    )
                  : controller.twoDigitSecond.isNotEmpty &&
                          controller.twoDigitMinutes.isNotEmpty
                      ? Column(
                        children: [
                          if (!controller.recorder.isRecording &&
                              controller.recordedAudioPath.isNotEmpty)
                            Container(
                              decoration: BoxDecoration(
                                color: ResColors.backgroundColor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: AudioFileWaveforms(
                                backgroundColor: ResColors.backgroundColor,
                                playerWaveStyle: PlayerWaveStyle(liveWaveColor: ResColors.playingWave,
                                  fixedWaveColor: ResColors.fixedWave,
                                  backgroundColor: ResColors.backgroundColor,
                                  seekLineThickness: 6
                                ),
                                size: Size(300, 50),
                                playerController: controller.audioPlayerController,
                              ),
                            ),
                          Container(
                              margin: EdgeInsets.only(),
                              child: Text(
                                '${controller.twoDigitMinutes} :${controller.twoDigitSecond}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: ResColors.primaryBlackText),
                              ),
                            ),
                        ],
                      )
                      : Container(),

              SizedBox(
                height: 20.h,
              ),
              controller.recordedAudio == null
                  ? RecordButton(
                      imagePath: controller.recorder.isRecording
                          ? 'stop_icon.png'
                          : 'mic_icon.png',
                      onTap: () async {
                        if (controller.recorder.isRecording) {
                          await controller.stop();
                        } else {
                          await controller.startRecord();
                        }
                      })
                  : SendRecordedAudio(
                    
                      playTap: () {
                        if (controller.recordedAudioPath.isNotEmpty) {
                          if (controller.isPlayingAudio) {
                            controller.stopPlayer();
                            print("STOPP");
                          } else {
                            controller.startPlayer();
                            print("PLAYYY");

                          }
                        } else {
                          print('No File FOUND!!!');
                        }

                        // controller.playAudio();
                      },
                      sendAudioTap: () {},
                      deleteTap: () {
                        alertDeleteAudio(context);
                      }, isPlaying: controller.isPlayingAudio,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> alertDeleteAudio(BuildContext context) {
  Get.defaultDialog(
      backgroundColor: ResColors.backgroundColor,
      title: Strings.appName,
      titleStyle: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
      middleText: Strings.areYouSureToDeleteAudio.tr,
      middleTextStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      actions: [
        TextButton(
            onPressed: () {
              Get.find<FotihaController>().deleteAudio();
              Navigator.pop(context);
            },
            child: Text(Strings.yes.tr, style: TextStyle(fontSize: 16.sp))),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(Strings.cancel.tr, style: TextStyle(fontSize: 16.sp))),
      ]);
  return Future.value(true);
}
