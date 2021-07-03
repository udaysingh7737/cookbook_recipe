import 'package:cookbook_recipe/UserProfile/AppBar_UserProfile.dart';
import 'package:cookbook_recipe/UserProfile/profile_screen_page.dart';
import 'package:cookbook_recipe/UserProfile/UserInfo.dart';
import 'package:cookbook_recipe/UserProfile/userProfile_Widget.dart';
import 'package:cookbook_recipe/UserProfile/user_preferences.dart';
import 'package:flutter/material.dart';



class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user =UserPreferences.myUser;
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          ProfileWidget(
              profileImage: user.profileImage,
              onClicked: () async{
                return Navigator.pushNamed(context, "/editProfile");
              },
          ),
          SizedBox(height: 20,),
          // this widget for user Name and Email Address.
          buildName(user),
          // for some space
          SizedBox(height: 24,),
          // for button
          Center(child: buildLogOutButton()),
          // for some space
          SizedBox(height: 24,),
          // for recors like count of recipes, saved
          RecordWidget(),
          SizedBox(height: 25,),

          AboutWidget(),




        ],
      ),
    );
  }

  Widget buildName(UserInfo user) => Column(
    children: [
      Text(user.name,
      style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10,),
      Text(user.email,
      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Colors.black45),
      )
    ],
  );

  Widget buildLogOutButton() => ButtonWidget(
    text: "Log Out",
    tip: "LogOut",
    onClicked: (){},
  );



}



