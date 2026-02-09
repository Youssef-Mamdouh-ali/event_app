import 'package:event_app/core/l10n/app_localizations.dart';
import 'package:event_app/core/l10n/app_localizations_ar.dart';
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.onSurface,
          size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.forgetPassword,
          style : Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 22,
            fontWeight: FontWeight.w400,)
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height * 0.03,),
              Image.asset(Appassets.forget_password),
            SizedBox(height: height * 0.05,),
            Customelevatedbutton(onPressed: (){},buttonName: AppLocalizations.of(context)!.resetPassword,)
            ],
          ),
        ),
      ),
    );
  }
}
