import 'package:al_fatiha/controller/base/base_controller.dart';
import 'package:al_fatiha/data/tools/strings/string.dart';
import 'package:al_fatiha/view/pages/todo/model/todo_model.dart';
import 'package:al_fatiha/view/pages/todo/services/notifi_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';


class TodoController extends BaseController{
    late Box<TodoModel> box;
    String title='';
    String description='';
    DateTime? pickedDate;
    TimeOfDay? pickedTime;
    TextEditingController dateController=TextEditingController();
    TextEditingController timeController=TextEditingController();
    List<TodoModel>todoList=[];
    @override
  void onInit() {

    box=Hive.box('todoBox');
      getAllTodos();
    super.onInit();
  }
    DateTime? combineDateAndTime(DateTime? date, TimeOfDay? time) {
      if (date == null || time == null) return null;

      return DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );

  }
   @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }
    Future<void> getAllTodos() async {
      // final box = await Hive.openBox<TodoModel>('todoBox');
      todoList= box.values.toList();
    }
    Future<void> saveTodo(TodoModel todo) async {
      await box.add(todo);
    }
    Future<void> deleteTodo(int index) async {
      await box.deleteAt(index);
      todoList.removeAt(index);
      print('DELETED');
    update();
    }
  Future<void>createTodo()async{
      if(title.isEmpty && description.isEmpty && pickedDate==null && pickedTime ==null){
        Get.snackbar(Strings.appName.tr, 'Select all fields!');
        return;
      }else{
        String timeOfDayToString(TimeOfDay time) => '${time.hour}:${time.minute}';
        DateTime? dateTime=combineDateAndTime(pickedDate, pickedTime!);

        if(dateTime!.isBefore(DateTime.now()) || dateTime==DateTime.now()){
          Get.snackbar(Strings.appName.tr, 'Select future time!');
          return;
        }
        TodoModel model=TodoModel(
            title: title,
            description: description,
            pickedDate:pickedDate!,
            timeOfDay:timeOfDayToString(pickedTime!)
        );
       // NotificationService().showNotification(id:0,title: "Todo Created", body: title);

        NotificationService().scheduleNotification(
          title:title,
          body:description,
          schedule:dateTime
        );
        await saveTodo(model);
        await getAllTodos();
        print('FINISH');

      }
      update();
      Get.back();
      Get.snackbar(Strings.appName.tr, 'Todo created!');
  }

  Future<void>testNot(DateTime dateTime)async{
    NotificationService().scheduleNotification(
        title:'title',
        body:'description',
        schedule:dateTime
    );
  }
}