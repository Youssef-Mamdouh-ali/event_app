import 'package:event_app/core/app_provider/app_settings_provider.dart';
import 'package:event_app/core/l10n/app_localizations.dart';
import 'package:event_app/core/routes/pages_routes_name.dart';
import 'package:event_app/core/widgets/customElevatedButton.dart';
import 'package:event_app/core/widgets/customTextFormField.dart';
import 'package:event_app/utils/appAssets.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
   SignInView({super.key});
   final _formKey = GlobalKey<FormState>();
   final _emailController = TextEditingController(text: "youssef@gmail.com") ;
   final _passwordController = TextEditingController(text: "Aa12345*5") ;
  @override
  Widget build(BuildContext context) {
    ///  Provider
    final appSettingsProvider = Provider.of<AppSettingsProvider>(context);
    /// Responsive screen
    late var height = MediaQuery.of(context).size.height;
    late var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  /// header logo
                  SizedBox(
                    height: height * 0.04,
                    width: width * 0.40,
                    child: Image.asset(Appassets.logo),
                  ),
                  SizedBox(height: height * 0.05),
                  Text(
                    AppLocalizations.of(context)!.login_to_your_account,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 30 , fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: height * 0.03),
               /// email 
               Customtextformfield(
                 controller: _emailController,
                      hintText: AppLocalizations.of(context)!.email,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(Appassets.email_icon),
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
                  Customtextformfield(
                    controller: _passwordController,
                      hintText: AppLocalizations.of(context)!.password,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(Appassets.password_icon),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            PagesRoutesName.forgetPassword,
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgetPassword,
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
                  Customelevatedbutton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        Navigator.pushNamedAndRemoveUntil(context, PagesRoutesName.layout, (route) => false);
                      }
                    },
                    buttonName: AppLocalizations.of(context)!.login,
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.do_not_have_account,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15)
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, PagesRoutesName.signUp);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.sign_up,
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
                          thickness: 0.5,
                          indent: width * 0.03,
                          endIndent: width * 0.03,
                          color: Appcolors.primaryColor,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: TextStyle(
                          fontSize: 17,
                          color: Appcolors.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          indent: width * 0.03,
                          endIndent: width * 0.03,
                          color: Appcolors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Customelevatedbutton(
                    onPressed: () {

                    },
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
                          AppLocalizations.of(context)!.login_with_google,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  SizedBox(height: height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (appSettingsProvider.currentLanguage == "en") {
                            appSettingsProvider.changeLanguage("ar");
                          } else {
                            appSettingsProvider.changeLanguage("en");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          height: height * 0.06,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            color: Appcolors.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              appSettingsProvider.currentLanguage[0].toUpperCase()+appSettingsProvider.currentLanguage.substring(1) ,
                              style: TextStyle(
                                color: Appcolors.whiteColor,
                                fontSize:24,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                         onPressed: () {
                        if (appSettingsProvider.currentTheme== ThemeMode.light){
                          appSettingsProvider.changeTheme(ThemeMode.dark);
                        }else{
                          appSettingsProvider.changeTheme(ThemeMode.light);
                        }
                      },
                        icon: Icon(Icons.light_mode , size: 30,),
                      )
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
