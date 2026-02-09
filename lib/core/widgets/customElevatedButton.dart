import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class Customelevatedbutton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? customChild ;
  final String? buttonName ;
  final Color? backgroundColor ;
  Customelevatedbutton({super.key, this.onPressed ,  this.customChild , this.buttonName , this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              padding: EdgeInsets.all(12),
              backgroundColor: backgroundColor ?? Appcolors.primaryColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Appcolors.strokeColor,
                  width: 1.5
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: customChild?? Text(
              buttonName ?? "",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Appcolors.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
