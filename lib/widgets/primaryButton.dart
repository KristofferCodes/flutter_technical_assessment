import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key, required this.text, required this.onTap, this.textStyle})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppConst.btnColor,
            borderRadius: BorderRadius.circular(50.0)),
        height: 60.h,
        width: AppConst.width * .9,
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                    color: AppConst.lightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.h),
          ),
        ),
      ),
    );
  }
}
