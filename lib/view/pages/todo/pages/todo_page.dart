import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:al_fatiha/view/pages/login/widgets/common_text.dart';
import 'package:al_fatiha/view/pages/todo/controller/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
        init: TodoController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: ResColors.mainBackground,
            appBar: AppBar(
              backgroundColor: ResColors.primaryColor,
              title: CommonText(
                text: 'Todo',
                color: Colors.white,
                size: 18,
              ),
              centerTitle: true,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/add_todo');
                          },
                          child: CommonText(
                            text: 'Add',
                            color: ResColors.primaryColor,
                            size: 20,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (controller.todoList.isNotEmpty)
                    Expanded(
                        child: ListView.builder(
                            itemCount: controller.todoList.length,
                            itemBuilder: (_, index) {
                              final todo = controller.todoList[index];
                              return Container(
                                margin: EdgeInsets.only(
                                  bottom: 13
                                ),
                                  width: double.maxFinite,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  decoration: BoxDecoration(
                                      color: ResColors.primaryColor,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: ResColors.borderColor,
                                      )),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonText(
                                            text: 'Title:',
                                            color: ResColors.white,
                                            fontWeight: FontWeight.w500,
                                            size: 14,
                                          ),
                                          CommonText(
                                            text: todo.title,
                                            color: ResColors.white,
                                            size: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          CommonText(
                                            text: 'Description:',
                                            color: ResColors.white,
                                            fontWeight: FontWeight.w500,
                                            size: 14,
                                          ),
                                          Container(
                                            child: Text(
                                              todo.description,
                                              style: TextStyle(
                                                color: ResColors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              maxLines: 4,
                                            ),
                                          ),
                                          Container(
                                            child: Divider(
                                              color: ResColors.white,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CommonText(
                                                    text: 'Date:',
                                                    color: ResColors.white,
                                                    fontWeight: FontWeight.w500,
                                                    size: 14,
                                                  ),
                                                  SizedBox(width: 8,),
                                                  CommonText(
                                                    text: DateFormat('dd.MM.yy')
                                                        .format(todo.pickedDate),
                                                    color: ResColors.white,
                                                    size: 18,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  CommonText(
                                                    text: 'Time:',
                                                    color: ResColors.white,
                                                    fontWeight: FontWeight.w500,
                                                    size: 14,
                                                  ),
                                                  SizedBox(width: 8,),
                                                  CommonText(
                                                    text: todo.timeOfDay,
                                                    color: ResColors.white,
                                                    size: 18,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                      
                                        ],
                                      ),
                                      Positioned(
                                       right: 1,
                                        child: IconButton(onPressed: (){
                                          controller.deleteTodo(index);
                                        }, icon: Icon(Icons.delete, color: ResColors.white,)),
                                      )
                                    ],
                                  ));
                            }))
                ],
              ),
            ),
          );
        });
  }
}
