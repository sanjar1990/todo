import 'package:al_fatiha/controller/login/login_controller.dart';
import 'package:al_fatiha/data/tools/strings/string.dart';
import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:al_fatiha/view/pages/login/widgets/app_bar.dart';
import 'package:al_fatiha/view/pages/login/widgets/login_text_field.dart';
import 'package:al_fatiha/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
        init: LoginController(Get.find()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBarCustom(title: Strings.entrance.tr,onTap: (){},),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.only(left: 50, right: 50).r,
                      height: size.height - 130.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuildFormField(
                              controller: controller.userNameController,
                              image:  Icon(Icons.email ,color: ResColors.colorAppBarText,size: 30.r,),
                              labelName: Strings.userName.tr,
                              hintText: ''),
                          SizedBox(height: 30.h),
                          BuildFormField(
                            controller: controller.passwordController,
                            image:  Icon(Icons.lock,color: ResColors.colorAppBarText,size: 30.r,),
                            labelName: Strings.password.tr,
                            hintText: '',
                            isPassword: true,
                          ),
                          SizedBox(height: 65.h),
                          CustomButton(
                              isPressed: controller.isLoading,
                              title: '',
                              callback: () => controller.login()
                              ),
                          SizedBox(height: 70.h),
                        ],
                      )),
                ),
                if (controller.isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        });
  }
}
