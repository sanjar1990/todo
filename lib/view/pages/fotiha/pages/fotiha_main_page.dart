import 'package:al_fatiha/data/tools/strings/string.dart';
import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:al_fatiha/view/pages/fotiha/controller/fotiha_controller.dart';
import 'package:al_fatiha/view/pages/login/widgets/app_bar.dart';
import 'package:al_fatiha/view/pages/login/widgets/common_text.dart';
import 'package:al_fatiha/view/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FotihaMainPage extends StatelessWidget {
  const FotihaMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FotihaController>(
        init: FotihaController(),
        builder: (controller){
          return Scaffold(
            backgroundColor: ResColors.mainBackground,
            // appBar: AppBarCustom(title: Strings.fotihaSurasi.tr,onTap: (){},),
            body: Container(
              padding: EdgeInsets.only(),
              margin: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 8
              ),
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonAppBar(title: Strings.fotihaSurasi.tr,onTap: (){},),
                  Container(
                      padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: ResColors.backgroundColor,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    height: 500.h,
                    child: ListView(
                      children: [
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: ResColors.mainBackground
                         ),
                           child: Column(
                             children: [
                               YoutubePlayer(controller: controller.playerController),
                               Container(
                                 padding: EdgeInsets.all(8),
                                 child: CommonText(text: controller.videoTitle,color: ResColors.primaryBlackText,
                                 size: 14, fontWeight: FontWeight.w500,
                                 ),
                               )
                             ],
                           ))
                      ],
                    ),
                  ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ResColors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(33),
                          topRight: Radius.circular(33)
                        )
                      ),
                      child: Container(
                        height: 64,
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20
                        ),
                        decoration: BoxDecoration(
                          color: ResColors.mainBackground,
                          borderRadius: BorderRadius.circular(64)
                        ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Container(

                        child: Text('Qiroatni tekshirish ...',
                        style: TextStyle(
                          color: ResColors.unSelectedText,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp
                        ),),
                      ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed('/read_fotiha_page');
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 9
                                ),
                              decoration: BoxDecoration(
                                color: ResColors.primaryColor,
                                borderRadius: BorderRadius.circular(48.r)
                              ),
                              child: Row(

                                children: [
                                  CommonText(text: Strings.read.tr, color: ResColors.white,size: 15, fontWeight: FontWeight.w500,),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Image.asset('assets/icons/arrow_left.png'),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      ),
                    )
                ],
              ),
            ),
          );
        });
  }
}
