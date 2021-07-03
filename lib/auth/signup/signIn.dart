import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookbook_recipe/AuthServices/AuthServices.dart';
import 'package:cookbook_recipe/AuthServices/ShowDialogAlert.dart';
import 'package:cookbook_recipe/auth/Auth_Body.dart';
import 'package:cookbook_recipe/auth/componets/screenfunction.dart';
import 'package:cookbook_recipe/auth/login/logIn.dart';
import 'package:cookbook_recipe/auth/signup/background.dart';
import 'package:cookbook_recipe/constants.dart';
import 'package:cookbook_recipe/utils/Util_Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  // authServices instance
  final AuthServices _authServices = AuthServices();
  //firebase Auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  //Registration Alert Dialog
  Future<void> showSignInDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(height: 50,
              decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(32)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 5),
                child: Text('WELCOME To CookBook Family'),
              )),
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
                Navigator.pushNamedAndRemoveUntil(
                  context,"/login",(Route<dynamic> route) => false,);
              },
            ),
          ],
        );
      },
    );
  }
  // google login Alert Dialog
  Future<void> showDialogGoogleSignIn() async {
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
                Navigator.pushNamedAndRemoveUntil(context, "/home",(Route<dynamic> route) => false,);
              },
            ),
          ],
        );
      },
    );
  }

  void validate(){
    if(globalKey.currentState.validate()){
      print("Validate");
    }
    else{
      print("Not validate");
    }
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

                  TextFieldContainer(child: TextFormField(
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

                  TextFieldContainer(child: TextFormField(
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

                  RoundedButton(text: "Create",
                    color: kPrimaryColor2,
                    press: ()async{


                      if(globalKey.currentState.validate()){
                        print("Validate");

                        dynamic result = await _authServices.signInEmailPassword(
                            _emailController.text,
                            _passwordController.text
                        );

                        if(result == 0){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Profile Created Successfully !!"),));
                          showSignInDialog();
                          print('User LogIned in');

                        }else if(result == 'weak-password'){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(
                                'The password provided is too weak.',
                                style: TextStyle(color: Colors.black),),
                                backgroundColor: Colors.red,
                              ));

                        }else if(result == 'email-already-in-use'){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(
                                'The account already exists for that email.',
                                style: TextStyle(color: Colors.black),),
                                backgroundColor: Colors.red,
                              ));
                          print('The account already exists for that email.');
                        }
                      }
                        else{
                          print("not validated");
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Unable Create profile...",style: TextStyle(color: Colors.white),),
                                backgroundColor: Colors.red[400],
                              ));

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
                                  return LogInPage();
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
                            dynamic result = await _authServices.signInGoogleAuth();
                            if(result == 0){
                              showDialogGoogleSignIn();
                            }else{
                              print(result);
                            }
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





