import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';
import '../resources/values_manager.dart';

class MyAuthTextField extends StatelessWidget {
  final TextEditingController controller;
  bool? isObsecure;
  final String? Function(String?)? validator;
  TextStyle? style;
  TextStyle? hintStyle;
  TextInputType? inputType;
  final String? hintText;
  final Widget? suffix;

  MyAuthTextField({
    Key? key,
    required this.controller,
    this.isObsecure,
    this.validator,
    this.style,
    this.hintStyle,
    this.inputType,
    this.hintText,
    this.suffix,
  }) : super(key: key);

  //* myBorder
  InputBorder getMyBorder({bool? isFocus}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
        borderSide: isFocus??false?BorderSide.none: BorderSide.none,
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: isObsecure ?? false,
        validator: validator,
        autofocus: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: style ??
            getRegularStyle(
                color: ColorManager.white.withOpacity(0.85), fontSize: FontSizeManager.s18),
        keyboardType: inputType ?? TextInputType.text,
        decoration: InputDecoration(
          border: getMyBorder(),
          errorBorder: getMyBorder(),
          enabledBorder: getMyBorder(),
          focusedBorder:getMyBorder(isFocus: true),
          disabledBorder: getMyBorder(),
          focusedErrorBorder: getMyBorder(),
          filled: true,
          fillColor: ColorManager.black.withOpacity(0.2),
          
          suffix: suffix,
          contentPadding: const EdgeInsets.all(AppPadding.p12),
          hintStyle: hintStyle ??
              getRegularStyle(
                  color: ColorManager.lightGrey, fontSize: FontSizeManager.s16),
          hintText: hintText,
        ));
  }
}

