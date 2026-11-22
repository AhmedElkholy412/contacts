import 'package:flutter/material.dart';

import 'app_color.dart';

class AddTextFormField extends StatelessWidget {
  String text;
  TextEditingController controller = TextEditingController();
  TextInputType keyboardType;
  String? Function(String?)? validator;
  ValueChanged<String>? onChanged;

  AddTextFormField({
    required this.text,
    required this.controller,
    required this.keyboardType,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      cursorColor: AppColor.gold,
      maxLines: 1,
      style: TextStyle(color: AppColor.gold),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: AppColor.gold),
        errorStyle: TextStyle(color: AppColor.red),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.gold),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.gold),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.red),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.red),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
