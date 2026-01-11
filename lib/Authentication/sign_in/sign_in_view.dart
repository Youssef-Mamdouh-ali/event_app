import 'package:event_app/core/routes/pages_routes_name.dart';
import 'package:event_app/utils/appAssets.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/customElevatedButton.dart';
import '../../core/widgets/customTextFormField.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    late var height = MediaQuery.of(context).size.height;
    late var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: height * 0.23,
                width: width * 0.34,
                child: Image.asset(Appassets.logoa),
              ),
              SizedBox(height: height * 0.02),
              Customtextformfield(
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: height * 0.02),
              Customtextformfield(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
                isPassword: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PagesRoutesName.forgetPassword);
                    },
                    child: Text(
                      "Forget Password?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Appcolors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Appcolors.primaryColor,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Customelevatedbutton(onPressed: () {}, buttonName: "Login"),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t Have Account ?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Appcolors.textMainColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PagesRoutesName.signUp);
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Appcolors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationColor: Appcolors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      indent: width * 0.03,
                      endIndent: width * 0.03,
                      color: Appcolors.primaryColor,
                    ),
                  ),
                  Text(
                    "Or",
                    style: TextStyle(
                      fontSize: 17,
                      color: Appcolors.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      indent: width * 0.03,
                      endIndent: width * 0.03,
                      color: Appcolors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Customelevatedbutton(
                onPressed: () {},
                customChild: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.06,
                      height: height * 0.03,
                      child: Image.asset(Appassets.google_logo),
                    ),
                    SizedBox(width: width * 0.02),
                    Text(
                      "Login With Google",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Appcolors.primaryColor,
                      ),
                    ),
                  ],
                ),
                backgroundColor: Appcolors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
