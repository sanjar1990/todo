import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      DateTime scheduleTime;
      DatePicker.showDateTimePicker(context,
      showTitleActions: true,
        onChanged: (date)=>scheduleTime=date,
        onConfirm: (date){

        }
      );
    }, child: Text("Select Date time"));
  }
}
