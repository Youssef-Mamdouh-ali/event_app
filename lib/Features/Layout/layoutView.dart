import 'package:event_app/Features/favorit/favoriteView.dart';
import 'package:event_app/Features/home/homeView.dart';
import 'package:event_app/Features/profile/profileView.dart';
import 'package:event_app/core/app_provider/app_settings_provider.dart';
import 'package:event_app/core/routes/pages_routes_name.dart';
import 'package:event_app/utils/appAssets.dart';
import 'package:event_app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart' show Provider;

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final List<Widget> _pages = [
    Homeview(),
    Favoriteview(),
    Profileview()
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppSettingsProvider>(context) ;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, PagesRoutesName.addEvent);
        },
        backgroundColor: Appcolors.primaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add , color: Colors.white,),
      ),
      body:_pages[provider.currentIndex] ,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadiusGeometry.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16)
        ),
        child: BottomNavigationBar(
          currentIndex: provider.currentIndex,
          onTap: provider.changeCurrentIndex,
          selectedItemColor: Appcolors.primaryColor,
          unselectedItemColor: Appcolors.textSecondaryColor,
          type: BottomNavigationBarType.fixed,

          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Appassets.inactive_home_icon),
              activeIcon: SvgPicture.asset(Appassets.active_home_icon),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Appassets.inactive_favorite_icon),
              activeIcon: SvgPicture.asset(Appassets.active_favorite_icon),
              label: "favorite",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Appassets.inactive_profile_icon),
              activeIcon: SvgPicture.asset(Appassets.active_favorite_icon),
              label: "profile",
            ),
          ],
        ),
      ),
    );
  }
}
