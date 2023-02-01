// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:book_app/shared/styles/colors.dart';
import 'package:book_app/shared/styles/icon_broken.dart';
Widget defaultButton ({
  double width = double.infinity,
  double? height,
  Color backgroundColor = defaultColor,
  Color textColor = Colors.white,
  double radius = 0.0,
  required String text,
  @required function,
}) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: backgroundColor,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
      ),
    ),
  ),
);

Widget defaultTextFormField({
  required String label,
  required TextEditingController controller,
  required TextInputType type,
  required validator,
  border, //OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
  bool obscureText = false,
  Icon? prefixIcon,
  Icon? suffixIcon,
  onFieldSubmitted,
  onChanged,
  suffixPressed,
  onTap,
  enabled,
}) => TextFormField(
  enabled: enabled,
  controller: controller,
  keyboardType: type,
  obscureText: obscureText,
  onFieldSubmitted: onFieldSubmitted,
  onChanged: onChanged,
  onTap: onTap,
  validator: validator,
  decoration: InputDecoration(
    border: border,
    labelText: label,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon != null ? IconButton(
        onPressed: suffixPressed,
        icon: suffixIcon,
    ): null,
  ),
);

PreferredSizeWidget defaultAppBar({required BuildContext context, String? title, List<Widget>? actions,}) =>AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: const Icon(IconBroken.Arrow___Left_2),
  ),
  titleSpacing: 5.0,
  title: Text(title!),
  actions: actions,
);

Widget defaultTextButton({required function,required String text,}) => TextButton(
  onPressed: function,
  child: Text(text.toUpperCase()),
);

Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);

void navigateTo(context,Widget widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context,Widget widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),(Route<dynamic> route) => false,
);

void showToast ({required String text,required ToastStates state ,textColor}) => Fluttertoast.showToast(
  msg: text,
  textColor: Colors.white,
  backgroundColor: chooseToastColor(state),
  toastLength: Toast.LENGTH_LONG,
);

enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color =  Colors.amber;
      break;
  }
  return color;
}

