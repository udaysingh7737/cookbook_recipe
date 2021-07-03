import 'package:cookbook_recipe/auth/background.dart';
import 'package:cookbook_recipe/auth/componets/screenfunction.dart';
import 'package:cookbook_recipe/auth/login/logIn.dart';
import 'package:cookbook_recipe/auth/signup/signIn.dart';
import 'package:cookbook_recipe/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class Auth_Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // to fetch total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Background(
      child:
      SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Welcome to प्रसादम् ! ",
              style: TextStyle(
                  fontSize: size.height*size.width* 00.0001,fontFamily: "cursive",fontWeight: FontWeight.w800
            ),
            ),
            SizedBox(height: size.height*0.02,),
            Image(image: AssetImage("assets/images/Cooking.gif"),
            height: size.height * 0.45,),
            SizedBox(height: size.height*0.03,),

            RoundedButton(
              text: "LOG IN",
              color: kPrimaryColor2,
              press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LogInPage();
                }
                )
                );
              },
            ),
            OrDivider(),

            RoundedButton(
              text: "SIGN UP",
              color: Color(0xFFDEB0E3),
              textColor: Colors.black87,
              press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SignInPage();
                }
                )
                );
              },

            ),




          ],
        ),
      ),
    );

  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color,textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press ,
    this.color ,
    this.textColor = Colors.white,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),

        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: color,
            onPressed: press,
            child:
            Text(text,style:
            TextStyle(
                fontWeight: FontWeight.w500,color: textColor
            ),
            )
        ),
      ),
    );
  }
}

