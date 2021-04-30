
import 'package:cookbook_recipe/Another_auth/Auth12.dart';
import 'package:cookbook_recipe/auth/Auth_Body.dart';
import 'package:cookbook_recipe/auth/Screen_Function/screenfunction.dart';

import 'package:cookbook_recipe/auth/signup/background.dart';
import 'package:cookbook_recipe/constants.dart';
import 'package:cookbook_recipe/models/profile/profile_screen.dart';
import 'package:cookbook_recipe/utils/Util_Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Sign_up12 extends StatefulWidget {
  @override
  _Sign_up12State createState() => _Sign_up12State();
}

class _Sign_up12State extends State<Sign_up12> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> globalKey=GlobalKey<FormState>();

  void validate(){
    if(globalKey.currentState.validate()){
      print("Validate");
    }
    else{
      print("Not validate");
    }
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('WELCOME To CookBook Family'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You Have Successfully Register!!'),
                Text('Now ! You can Login  '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Login Please'),
              onPressed: () {
                Util_Constents.preferences.setBool("loggedin", true);
                Navigator.pushNamedAndRemoveUntil(context, "/login",(Route<dynamic> route) => false,);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog_Google_SignIn() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(height: 50,
              decoration: BoxDecoration(color: Colors.purple[200],borderRadius: BorderRadius.circular(12)),
              child: Center(child: Text('WELCOME To CookBook',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),))),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(height: 40,
                    decoration:
                BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(26)),
                    child: Center(child: Text('You are Login With Google',style: TextStyle(color: Colors.white,fontSize: 15),))),
                SizedBox(height: 15,),
                Image.asset("assets/images/Avtar.png", height: 150,)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Continue'),
              onPressed: () {
                Util_Constents.preferences.setBool("loggedin", true);
                Navigator.pushNamedAndRemoveUntil(context, "/profile",(Route<dynamic> route) => false,);
              },
            ),
          ],
        );
      },
    );
  }


  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    PatternValidator(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
        errorText: 'Email must have correct Formet')
  ]);


  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: globalKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top:20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height*0.05,),
                  Text("Sign Up To प्रसादम् !",
                    style: TextStyle(
                      fontFamily: "cursive",
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                    ),
                  ),

                  SvgPicture.asset("assets/icons/SignIn_new1.svg",
                    height: size.height *0.37,
                  ),

                  TextFieldContainer_Signup(child: TextFormField(
                    controller: _emailController,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value){},
                    decoration: InputDecoration(
                      icon: Icon(Icons.person,color: Color(0xFFA336F8),),
                      hintText: "Your Email",
                      border: InputBorder.none,
                    ),
                    validator: emailValidator,
                  ),
                  ),

                  TextFieldContainer_Signup(child: TextFormField(
                    controller: _passwordController,
                    maxLines: 1,
                    obscureText: true,

                    onChanged: (value){},
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: Color(0xFFA336F8),
                        ),
                        hintText: "Password",
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.visibility,color: Color(0xFFA336F8))
                    ),
                    validator: passwordValidator,
                  ),
                  ),

                  RoundedButton(text: "Login",
                    color: kPrimaryColor2,
                    press: () async{

                      if(globalKey.currentState.validate()){
                        print("Validate");
                          await _firebaseAuth.createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile Created Successfully !!"),));
                            _showMyDialog();
                            }
                            );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile Created Successfully !!"),));
                        }
                        else{
                          print("not validated");

                      }

                    },
                  ),
                  SizedBox(height: size.height*0.02,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Text("Already Have Account !",
                        style: TextStyle(color: Color(0xFFA336F8),),
                      ),
                      SizedBox(width: 5,),
                      InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context){
                                  return Another_auth12();
                                }));
                          },
                          child: Text("Log In", style: TextStyle(fontWeight: FontWeight.bold, color: Color(
                              0xFF221DB8),
                          decoration: TextDecoration.underline),)
                      ),

                    ],
                  ),

                  OrDivider(),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        SocialIcon( iconSrc: "assets/icons/google-plus.svg",
                          press: ()async{
                            final GoogleSignInAccount googleUser= await GoogleSignIn().signIn();
                            final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
                            final GoogleAuthCredential credential =
                            GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);

                            await FirebaseAuth.instance.signInWithCredential(credential).then((value) => _showMyDialog_Google_SignIn());
                          },
                        ),
                      ],
                    ),
                  ),


                ]
              ),
            ),
          ),
        ),
      ),

    );
  }
}




class TextFieldContainer_Signup extends StatelessWidget {
  //final color,text;
  final Widget child;
  const TextFieldContainer_Signup({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      height: size.height * 0.07,
      decoration: BoxDecoration(color: Color(0xFFEFC4FF),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}