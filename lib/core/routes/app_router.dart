
import 'package:event_app/Features/Authentication/forget_password/forget_password.dart';
import 'package:event_app/Features/Authentication/sign_in/sign_in_view.dart';
import 'package:event_app/Features/Authentication/sign_up/sign_up_view.dart';
import 'package:event_app/Features/Layout/layoutView.dart';
import 'package:event_app/Features/add_event/add_event.dart';
import 'package:event_app/Features/favorit/favoriteView.dart';
import 'package:event_app/Features/home/homeView.dart';
import 'package:event_app/Features/onboarding/onboarding_view.dart';
import 'package:event_app/Features/profile/profileView.dart';
import 'package:event_app/core/routes/pages_routes_name.dart';
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

    case PagesRoutesName.layout :
      return MaterialPageRoute(builder: (context) => LayoutView() , settings: settings);

    case PagesRoutesName.home :
      return MaterialPageRoute(builder: (context) => Homeview() , settings: settings);

    case PagesRoutesName.favorite :
      return MaterialPageRoute(builder: (context) => Favoriteview() , settings: settings);

    case PagesRoutesName.profile :
      return MaterialPageRoute(builder: (context) => Profileview() , settings: settings);

    case PagesRoutesName.addEvent :
      return MaterialPageRoute(builder: (context) => AddEvent() , settings: settings);

  }

}

}