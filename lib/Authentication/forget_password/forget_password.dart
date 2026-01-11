import 'package:event_app/core/widgets/customElevatedButton.dart';
import 'package:event_app/utils/appAssets.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    late var height = MediaQuery.of(context).size.height;
    late var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Appcolors.primaryColor),
        title: Text(
          "Forget Password",
          style: TextStyle(
            color: Appcolors.primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Image.asset(Appassets.forget_password),
            SizedBox(height: height * 0.02,),
            Customelevatedbutton(onPressed: (){},buttonName: "Reset Password",)
            ],
          ),
        ),
      ),
    );
  }
}
