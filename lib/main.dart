import 'package:event_app/core/routes/app_router.dart';
import 'package:event_app/core/routes/pages_routes_name.dart';
import 'package:flutter/material.dart';

import 'onboarding/onboarding_view.dart';
void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute: PagesRoutesName.signIn,
     onGenerateRoute: AppRouter.onGenerateRoute,
   );
  }

}