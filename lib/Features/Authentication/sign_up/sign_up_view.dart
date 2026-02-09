import 'package:event_app/core/l10n/app_localizations.dart';
import 'package:event_app/core/routes/pages_routes_name.dart';
import 'package:event_app/core/widgets/customElevatedButton.dart';
import 'package:event_app/core/widgets/customTextFormField.dart';
import 'package:event_app/utils/appAssets.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpView extends StatelessWidget {
   SignUpView({super.key});
final _formKey = GlobalKey<FormState>() ;
final _nameController = TextEditingController() ;
final _emailController = TextEditingController() ;
final _passwordController = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    late var height = MediaQuery.of(context).size.height;
    late var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// header logo
                  SizedBox(
                    height: height * 0.04,
                    width: width * 0.40,
                    child: Image.asset(Appassets.logo),
                  ),
                  SizedBox(height: height * 0.05),
                  Text(AppLocalizations.of(context)!.create_your_account,style:Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24 , fontWeight: FontWeight.w600),)
                  ,SizedBox(height: height * 0.05),
                  // name
                  Customtextformfield(
                    controller: _nameController,
                      hintText: AppLocalizations.of(context)!.enter_your_name,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          Appassets.user_icon,
                        ),

                      ),
                      validator: (value){
                        if(value == null || value.trim().isEmpty){
                          return "please Enter your name " ;
                        }else{
                          return null ;
                        }
                      },
                    ),

                  SizedBox(height: height * 0.02),
                  // email
                  Customtextformfield(
                    controller: _emailController,
                      hintText: AppLocalizations.of(context)!.enter_your_email,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          Appassets.email_icon,
                        ),
                      ),
                        validator: (value) {
                          // 1. Check if the field is empty
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your email";
                          }
                          // 2. Define the email regex pattern
                          final emailRegex = RegExp(
                              r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$'
                          );
                          // 3. Check if the input matches the pattern
                          if (!emailRegex.hasMatch(value)) {
                            return "Please enter a valid email address";
                          }

                          return null;
                        },
                    ),

                  SizedBox(height: height * 0.02),
                  // password
                  Customtextformfield(
                    controller: _passwordController,
                    hintText: AppLocalizations.of(context)!.enter_your_password,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Appassets.password_icon,
                      ),
                    ),
                    isPassword: true,
                    validator: (value) {
                      // 1. Check if empty
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }

                      // 2. Password regex
                      final passwordRegex = RegExp(
                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                      );

                      // 3. Validate password
                      if (!passwordRegex.hasMatch(value)) {
                        return "Password must be at least 8 characters,\ninclude upper, lower, number & special character";
                      }

                      return null;
                    },

                  ),
                  SizedBox(height: height * 0.02),
                  // password
                  Customtextformfield(
                    hintText: AppLocalizations.of(context)!.confirm_your_password,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Appassets.password_icon,
                      ),
                    ),
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }

                      if (_passwordController.text != value) {
                        return "password doesn't match";
                      }

                      return null;
                    },

                  ),
                  SizedBox(height: height * 0.02),
                  Customelevatedbutton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        Navigator.pushNamedAndRemoveUntil(context, PagesRoutesName.layout, (route) => false);
                      }
                    },
                    buttonName: AppLocalizations.of(context)!.sign_up,
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.already_have_an_account,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15,fontWeight: FontWeight.w500)
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, PagesRoutesName.signIn);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
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
        ),
      ),
    );
  }
}
