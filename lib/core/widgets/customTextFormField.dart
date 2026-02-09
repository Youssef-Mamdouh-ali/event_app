import 'package:flutter/material.dart';

import '../../utils/appColors.dart';

class Customtextformfield extends StatefulWidget {
  final TextEditingController? controller;

  final String? hintText;

  final Widget? prefixIcon;

  final bool isPassword;

  final void Function()? onPressed;

  final String? Function(String?)? validator;

  void Function(String)? onFieldSubmitted;

  int maxLines;

  Customtextformfield({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.onPressed,
    this.validator,
    this.onFieldSubmitted,
    this.maxLines = 1,
  });

  @override
  State<Customtextformfield> createState() => _CustomtextformfieldState();
}

class _CustomtextformfieldState extends State<Customtextformfield> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,

      /// validation
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      controller: widget.controller,
      // autovalidateMode: AutovalidateMode.always,
      cursorColor: Appcolors.borderColor,
      keyboardType: TextInputType.visiblePassword,
      obscureText: widget.isPassword ? obscure : false,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        fillColor: Appcolors.whiteColor,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: obscure
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                color: Appcolors.borderColor,
              )
            : null,
        hint: Text(
          widget.hintText ?? "",
          style: TextStyle(fontSize: 16, color: Appcolors.textSecondaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Appcolors.strokeColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Appcolors.strokeColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Appcolors.strokeColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Appcolors.strokeColor),
        ),
      ),
    );
  }
}
