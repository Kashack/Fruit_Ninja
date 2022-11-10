import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  String hintText;
  Widget? prefix_icon;
  Widget? suffix_icon;
  bool isObscureText;
  String? Function(String?)? validator;
  TextInputType? inputType;
  Function(String)? onchanged;

  TextFieldForm(
      {
        required this.hintText,
        this.inputType,
        this.prefix_icon,
        this.suffix_icon,
        this.isObscureText = false,
        this.validator,
        this.onchanged
      });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      // color: Colors.white,
      child: TextFormField(
        keyboardType: inputType,
        onChanged: onchanged,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          fillColor: Colors.white,
          filled: true,
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          ),
          prefixIcon: prefix_icon,
          hintText: hintText,
          suffixIcon: suffix_icon,
        ),
        obscureText: isObscureText,
      ),
    );
  }
}
