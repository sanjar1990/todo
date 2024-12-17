import 'package:al_fatiha/data/tools/styles/res_colors.dart';
import 'package:flutter/material.dart';

class CreateTime extends StatelessWidget {
  const CreateTime({super.key, required this.timeController, required this.onTap});
  final TextEditingController timeController;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: timeController,
      decoration: InputDecoration(
        labelText: 'SELECT DATE',
        filled: true,
        fillColor: ResColors.backgroundColor,
        prefixIcon: Icon(Icons.timer),
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
    );
  }
}
