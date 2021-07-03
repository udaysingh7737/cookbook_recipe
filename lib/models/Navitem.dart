
import 'package:cookbook_recipe/UserProfile/User_Profile_Screen.dart';
import 'package:cookbook_recipe/models/home_screen.dart';
import 'package:cookbook_recipe/models/profile/profile_screen.dart';

import 'package:flutter/material.dart';

class NavItem{
  final int id;
  final String icon;
  final Widget destination;

  NavItem({this.id, this.icon,this.destination});

  bool destinationChecker(){
    if (destination != null){
      return true;
    }
    return false;
  }

}

class NavItems extends ChangeNotifier {
  int selectedIndex = 0;

  void chnageNavIndex({int index}) {
    selectedIndex = index;
    // if any changes made it notify widgets that use the value
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/icons/home.svg",
      destination: HomeScreen(),
    ),

    NavItem(
      id:2,
      icon: "assets/icons/user_icon.svg",
      destination: UserProfilePage(),
    ),

    NavItem(
      id:3,
      icon: "assets/icons/chef.svg",
      destination: ProfileScreen(),

      /*
      * SizedBox(width: defualtSize*4,),

              SizedBox(child: MaterialButton(
                  child: Text(
                    "Login"), onPressed: () {
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Auth_WelcomeScreen())
                      );
              }

              )
              ) */
    ),
/*
    NavItem(
      id:4,
      icon: "assets/icons/user.svg",
     // destination: HomeScreen(),
    ),
*/
  ];
}