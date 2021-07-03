import 'package:cookbook_recipe/UserProfile/AppBar_UserProfile.dart';
import 'package:cookbook_recipe/UserProfile/UserInfo.dart';
import 'package:cookbook_recipe/UserProfile/textfeild_widget.dart';
import 'package:cookbook_recipe/UserProfile/userProfile_Widget.dart';
import 'package:cookbook_recipe/UserProfile/user_preferences.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  UserInfo user =UserPreferences.myUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            ProfileWidget(
              profileImage: user.profileImage,
              isEdit: true,
              onClicked: () async{
                return Navigator.pushNamed(context, "/editProfile");
              },
            ),

            const SizedBox(height: 24,),

            TextFieldWidget(
              label: "Full Name",
              text: user.name,
              onChanged: (name){},
            )
          ],
        )
    );
  }
}
