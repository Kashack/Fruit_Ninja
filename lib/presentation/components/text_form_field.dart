import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  String hintText;
  Widget? prefix_icon;
  Widget? suffix_icon;
  bool isObscureText;

  TextFieldForm(
      {required this.hintText,
      this.prefix_icon,
      this.suffix_icon,
      this.isObscureText = false,
      });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none
          ),
          icon: prefix_icon,
          hintText: hintText,
          suffixIcon: suffix_icon,
        ),
        obscureText: isObscureText,
      ),
    );
  }
}
