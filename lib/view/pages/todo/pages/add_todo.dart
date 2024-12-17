import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:al_fatiha/view/pages/login/widgets/common_text.dart';
import 'package:al_fatiha/view/pages/todo/controller/todo_controller.dart';
import 'package:al_fatiha/view/pages/todo/widgets/create_date.dart';
import 'package:al_fatiha/view/pages/todo/widgets/create_description.dart';
import 'package:al_fatiha/view/pages/todo/widgets/create_time.dart';
import 'package:al_fatiha/view/pages/todo/widgets/create_title.dart';
import 'package:al_fatiha/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  Future<void> _selectDate(
      BuildContext context, TodoController controller) async {
  DateTime? pickedDate=  await showDatePicker(
       context: context,
      initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
  if(pickedDate!=null){
    controller.dateController.text =
        DateFormat('dd.MM.yy').format(pickedDate);
    controller.pickedDate = pickedDate;
    controller.update();
  }
  }

  Future<void> _selectTime(
      BuildContext context, TodoController controller) async {
    TimeOfDay? pickedTime =
        await showTimePicker(
          context: context,
            initialTime: TimeOfDay.now(),
        );
    if (pickedTime != null) {
      controller.timeController.text =
          pickedTime.format(context);
      controller.pickedTime = pickedTime;
      controller.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
        init: TodoController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ResColors.mainBackground,
            appBar: AppBar(
              backgroundColor: ResColors.primaryColor,
              title: CommonText(
                text: 'Add Todo',
                color: Colors.white,
                size: 18,
              ),
              centerTitle: true,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  CreateTitle(
                    onChanged: (String value) {
                      controller.title = value;
                    },
                  ),
                  CreateDescription(
                    onChanged: (String value) {
                      controller.description = value;
                    },
                  ),
                  CreateDate(
                    dateController: controller.dateController,
                    onTap: () {
                      _selectDate(context, controller);
                    },
                  ),
                  SizedBox(height: 20,),

                  CreateTime(
                    timeController: controller.timeController,
                    onTap: () => _selectTime(context, controller),
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  CustomButton(
                    isColorChange: controller.title.isNotEmpty&&controller.description.isNotEmpty
                    && controller.pickedDate!=null && controller.pickedTime!=null,
                    title: 'Add Todo', callback: controller.createTodo,),

                ],
              ),
            ),
          );
        });
  }
}
