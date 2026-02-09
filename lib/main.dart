import 'package:event_app/core/app_provider/app_settings_provider.dart';
import 'package:event_app/core/app_theme/theme_manager.dart';
import 'package:event_app/core/l10n/app_localizations.dart';
import 'package:event_app/core/routes/app_router.dart';
import 'package:event_app/core/routes/pages_routes_name.dart';
import 'package:event_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      create: (context) => AppSettingsProvider()
      ,child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appSettingsProvider = Provider.of<AppSettingsProvider>(context);
    return MaterialApp(
     title: "Evently App",
        themeMode: appSettingsProvider.currentTheme,
        theme: ThemeManager.getLightTheme(),
        darkTheme: ThemeManager.getDarkTheme(),
        debugShowCheckedModeBanner: false,
     initialRoute: PagesRoutesName.signIn,
     onGenerateRoute: AppRouter.onGenerateRoute,
     locale: Locale(appSettingsProvider.currentLanguage),
     localizationsDelegates: AppLocalizations.localizationsDelegates ,
     // [
     //   GlobalMaterialLocalizations.delegate,
     //   GlobalWidgetsLocalizations.delegate,
     //   GlobalCupertinoLocalizations.delegate,
     // ],
     supportedLocales: AppLocalizations.supportedLocales
     // [
     //   Locale('en'), // English
     //   Locale('es'), // Spanish
     // ],
   );
  }

}