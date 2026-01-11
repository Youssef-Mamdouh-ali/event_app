import 'package:event_app/Authentication/forget_password/forget_password.dart';
import 'package:event_app/Authentication/sign_in/sign_in_view.dart';
import 'package:event_app/Authentication/sign_up/sign_up_view.dart';
import 'package:event_app/core/routes/pages_routes_name.dart';
import 'package:event_app/onboarding/onboarding_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {

static Route<dynamic>? onGenerateRoute (RouteSettings settings){

  switch(settings.name){

    case PagesRoutesName.onboarding :
      return MaterialPageRoute(builder: (context) => OnboardingView() , settings: settings);

    case PagesRoutesName.signIn :
      return MaterialPageRoute(builder: (context) => SignInView() , settings: settings);

    case PagesRoutesName.signUp :
      return MaterialPageRoute(builder: (context) => SignUpView() , settings: settings);

    case PagesRoutesName.forgetPassword :
      return MaterialPageRoute(builder: (context) => ForgetPassword() , settings: settings);

  }

}

}