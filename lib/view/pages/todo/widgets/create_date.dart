import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:flutter/material.dart';

class CreateDate extends StatelessWidget {
  const CreateDate({super.key, required this.dateController, required this.onTap});
  final TextEditingController dateController;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(0),
    child: TextField(

      controller: dateController,
      decoration: InputDecoration(
        labelText: 'SELECT DATE',
        filled: true,
          fillColor: ResColors.backgroundColor,
        prefixIcon: Icon(Icons.calendar_today),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ResColors.borderColor
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ResColors.borderColor
          ),
        ),
      ),
      readOnly: true,
      onTap:onTap,
    ),
    );
  }
}
