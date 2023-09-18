import 'package:flutter/material.dart';
import 'package:flutter_technical_assessment/utils/constants.dart';

void successSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(top: 50.0),
      content: Text(
        content,
        style: const TextStyle(color: AppConst.primaryColor),
      ),
      backgroundColor: AppConst.yellow,
    ),
  );
}

void failureSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(top: 50.0),
      content: Text(
        content,
      ),
      backgroundColor: Colors.red,
    ),
  );
}
