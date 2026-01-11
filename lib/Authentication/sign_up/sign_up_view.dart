import 'package:event_app/core/routes/pages_routes_name.dart';
import 'package:event_app/core/widgets/customElevatedButton.dart';
import 'package:event_app/core/widgets/customTextFormField.dart';
import 'package:event_app/utils/appAssets.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    late var height = MediaQuery.of(context).size.height;
    late var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Appcolors.primaryColor),
        title: Text(
          "Register",
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
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: height * 0.23,
                width: width * 0.34,
                child: Image.asset(Appassets.logoa),
              ),
              SizedBox(height: height * 0.02),
              Customtextformfield(
                hintText: "Name",
                prefixIcon: Icon(Icons.person),
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
              SizedBox(height: height * 0.02),
              Customtextformfield(
                hintText: "Re Password",
                prefixIcon: Icon(Icons.lock),
                isPassword: true,
              ),
              SizedBox(height: height * 0.02),
              Customelevatedbutton(
                onPressed: () {},
                buttonName: "Create Account",
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account ?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Appcolors.textMainColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PagesRoutesName.signIn);
                    },
                    child: Text(
                      "Login",
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
            ],
          ),
        ),
      ),
    );
  }
}
