import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookbook_recipe/models/profile/Profile_menu_item.dart';
import 'package:cookbook_recipe/models/profile/profile_info.dart';
import 'package:cookbook_recipe/size_config.dart';
import 'package:cookbook_recipe/utils/Util_Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Profile_Body extends StatefulWidget {

  @override
  _Profile_BodyState createState() => _Profile_BodyState();
}

class _Profile_BodyState extends State<Profile_Body> {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _showMyDialog(String title,String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
                Text(' Thnaks for service Again '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Good luck'),
              onPressed: () {
                Util_Constents.preferences.setBool("loggedin", false);
                Navigator.pushNamedAndRemoveUntil(context, "/login",(Route<dynamic> route) => false,);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<String>(context);
    double defualtSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
            Info(
                name: userName,
                email: "Rupendra@gmail.com",
                image: "assets/images/Avtar.png"
            ),
            SizedBox(height: defualtSize *2,),

            ProfileMenuBar(
              iconSrc: "assets/icons/bookmark_fill.svg",
              menuItem: "Saved Recipes",press: (){},
            ),


            ProfileMenuBar(
              iconSrc: "assets/icons/language.svg",
              menuItem: "Change language",press: (){},
              color: Colors.green,
            ),

            ProfileMenuBar(
              iconSrc: "assets/icons/deleteAccount.svg",
              menuItem: "Delete Account!!",
              color: Colors.red,
              press: ()async {
              try {
                final User user = auth.currentUser;
                await FirebaseFirestore.instance.collection('userDetails').doc(user.uid).delete();
                await FirebaseAuth.instance.currentUser.delete();
                final String title = "Welcome Back!!";
                final String message ='You Have Successfully Delete Your Account!!';
                _showMyDialog(title,message);
                //delect user data from database


              } on FirebaseAuthException catch (e) {
                if (e.code == 'requires-recent-login') {
                  print('The user must reauthenticate before this operation can be executed.');
                  final String message = 'The user must reauthenticate before this operation can be executed.  please login Again';
                  _showMyDialog(e.code, message);
                }
              }
            },
            ),
          ]

      ),
    );
  }
}




