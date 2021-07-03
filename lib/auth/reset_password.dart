import 'package:cookbook_recipe/AuthServices/AuthServices.dart';
import 'package:cookbook_recipe/auth/Auth_Body.dart';
import 'package:cookbook_recipe/auth/componets/screenfunction.dart';
import 'package:cookbook_recipe/auth/login/background.dart';
import 'package:cookbook_recipe/auth/signup/signIn.dart';
import 'package:cookbook_recipe/constants.dart';
import 'package:cookbook_recipe/utils/Util_Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';



class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final AuthServices _authServices = AuthServices();

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();



  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(color: Colors.lime[100],
              child: Text('WELCOME Back To CookBook',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.green),)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You are Login Successfully',style: TextStyle(color: Colors.purpleAccent),),
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
                /*
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => ProfileScreen()
                )
                );

                 */
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



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Background(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: globalFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height*0.00,),
                  /*
            GestureDetector(onTap: (){
              Navigator.pop(context);
            },
              child: Positioned(
                top: 0,left: 0,
                child: SvgPicture.asset("assets/icons/back.svg"),

              ),
            ),

             */

                  Text("Reset Your Password  ",
                    style: TextStyle(fontSize: 38,
                        fontFamily: "cursive",
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: size.height* 0.05,),

                  Image(image: AssetImage("assets/images/Forgot_password.gif"),
                    height: size.height * 0.35,

                  ),

                  TextFieldContainer(child: TextFormField(
                    controller: _emailController,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value){},
                    decoration: InputDecoration(
                      icon: Icon(Icons.person,color: Color(0xFFA336F8),),
                      hintText: "Enter Your Email",
                      border: InputBorder.none,
                    ),
                    validator: emailValidator,

                  ),
                  ),



                  // Text field for password
                  SizedBox(height: size.height*0.03,),

                  RoundedButton(text: "Reset Password",
                    color: kPrimaryColor2,
                    press: () async{
                      if (globalFormKey.currentState.validate()){
                        print("Validate");

                        dynamic resuklt = await _authServices.resetPassword(_emailController.text);

                        if(resuklt == 0){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Email Send successfully\nCheck Your Email...",style: TextStyle(color: Colors.white,fontSize: 16),),
                                backgroundColor: Colors.green[400],
                                behavior: SnackBarBehavior.floating,
                                padding: const EdgeInsets.symmetric(horizontal: 15,),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                                ),
                                margin:EdgeInsets.only(bottom: 30.0,left: 15,right: 15),
                                action: SnackBarAction(
                                  label: "Login",
                                  textColor: Colors.lightBlue,
                                  onPressed: (){
                                    Navigator.pushNamedAndRemoveUntil(context, "/login", (Route<dynamic>route) => false);
                                  },
                                ),

                              ));
                          print(resuklt);

                        }if(resuklt == 'user-not-found'){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(" Email is Not Registered...",style: TextStyle(color: Colors.white,fontSize: 15),),
                                backgroundColor: Colors.redAccent[400],
                              ));
                          print(resuklt);
                        }if(resuklt == 'too-many-requests'){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("We have blocked all requests from this device due to unusual activity. Try again later.",style: TextStyle(color: Colors.white,fontSize: 15),),
                                backgroundColor: Colors.redAccent[400],
                              ));
                          print(resuklt);
                        }else{
                          print(resuklt);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(resuklt,style: TextStyle(color: Colors.white,fontSize: 16),),
                                backgroundColor: Colors.redAccent[400],
                                behavior: SnackBarBehavior.floating,
                                padding: const EdgeInsets.symmetric(horizontal: 15,),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                                margin:EdgeInsets.only(bottom: 30.0,left: 15,right: 15),

                              ));
                        }
                      }else{
                        print("not validate");
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Enter Your Email",style: TextStyle(color: Colors.white),),
                              backgroundColor: Colors.red[400],
                            ));

                      }

                    },
                  ),
                  SizedBox(height: size.height*0.04),

                  // create an account widget
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Create An Account !",
                        style: TextStyle(color: Color(0xFFA336F8),),
                      ),
                      SizedBox(width: 5,),
                      InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context){
                                  return SignInPage();
                                }));
                          },
                          child: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, color: Color(
                              0xFF057D11),
                              decoration: TextDecoration.underline),)
                      ),


                    ],
                  ),


                  SizedBox(height: size.height*0.03,),
                ],
              ),
            ),
          ),
        )
    );
  }
}







