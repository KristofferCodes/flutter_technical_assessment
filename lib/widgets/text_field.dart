import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      this.onchanged,
      this.dcoration});

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? prefixIcon, suffixIcon;
  final TextEditingController controller;
  final void Function(String)? onchanged;
  final InputDecoration? dcoration;
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Container(
      width: 375.w,
      decoration: BoxDecoration(
          color: AppConst.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(AppConst.radius))),
      child: TextFormField(
        cursorHeight: 17,
        onChanged: onchanged,
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
            fontSize: 16.h,
            color: AppConst.lightColor,
            fontWeight: FontWeight.bold),
        decoration: dcoration ??
            InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              suffixIconColor: AppConst.primaryColor,
              hintStyle: TextStyle(
                  fontSize: 16.h,
                  color: AppConst.textBlack,
                  fontWeight: FontWeight.bold),
              errorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.radius)),
                  borderSide: const BorderSide(
                    color: AppConst.errorColor,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.radius)),
                  borderSide: const BorderSide(
                    color: AppConst.yellow,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
              disabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.radius)),
                  borderSide: const BorderSide(
                    color: AppConst.primaryColor,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.radius)),
                  borderSide: const BorderSide(
                    color: AppConst.textBlack,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
            ),
      ),
    );
  }
}
