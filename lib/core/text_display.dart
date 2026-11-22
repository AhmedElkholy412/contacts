import 'package:flutter/material.dart';

import 'app_color.dart';

class TextDisplay extends StatelessWidget{
  String text;
  TextDisplay({required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Text(text,
        style: TextStyle(color: AppColor.gold,
            fontSize: 16,fontWeight: FontWeight.w400),
      ),
    );
  }
}