import 'package:cookbook_recipe/AuthServices/AuthServices.dart';
import 'package:cookbook_recipe/auth/Auth_Body.dart';
import 'package:cookbook_recipe/auth/componets/screenfunction.dart';
import 'package:cookbook_recipe/auth/login/background.dart';
import 'package:cookbook_recipe/auth/reset_password.dart';
import 'package:cookbook_recipe/auth/signup/signIn.dart';
import 'package:cookbook_recipe/constants.dart';
import 'package:cookbook_recipe/utils/Util_Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';


class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final AuthServices _authServices = AuthServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // login alert Dialog
  Future<void> showLoginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
              color: Colors.lime[100],
              child: Text(
                'WELCOME Back To CookBook',
                style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
              )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'You are Login Successfully',
                  style: TextStyle(color: Colors.purpleAccent),
                ),
                Image.asset(
                  "assets/images/Avtar.png",
                  height: 150,
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Continue'),
              onPressed: () {
                Util_Constents.preferences.setBool("loggedin", true);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/profile",
                      (Route<dynamic> route) => false,
                );
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




  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    PatternValidator(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
        errorText: 'Email must have correct Format')
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
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
              SizedBox(height: size.height*0.05,),
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

              Text("Login To प्रसादम् ! ",
                style: TextStyle(fontSize: 32,
                    fontFamily: "cursive",
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: size.height* 0.001,),

              SvgPicture.asset("assets/icons/Login_new1.svg",
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

              // Text field for password
              TextFieldContainer(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,top: 15.0),
                  child: TextFormField(

                  controller: _passwordController,
                  validator:passwordValidator,

                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  onChanged: (value){},
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key,color: Color(0xFFA336F8),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    suffixIcon: Icon(Icons.visibility, color: Color(0xFFA336F8),
                    ),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
              ),
                ),
              ),

              RoundedButton(text: "Login",
                color: kPrimaryColor2,
                press: () async{
                    if (globalFormKey.currentState.validate()){
                      print("Validate");
                      dynamic result = await _authServices.logInEmailPassword(_emailController.text, _passwordController.text);
                      if(result == 0){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Processing please wait!!"),));
                        showLoginDialog();
                      }else if(result== 'user-not-found'){
                        print('No user found for that email.');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Wrong Email Address. Try Again!!!",style: TextStyle(color: Colors.white),),
                              backgroundColor: Colors.red[400],
                            ));
                      }else if(result== 'wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Wrong Password. Try Again!!!",style: TextStyle(color: Colors.white),),
                                backgroundColor: Colors.red[400],
                              ));
                          print('Wrong password provided for that user.');
                      }
                    }else{
                      print("not validate");
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Unable to Login...",style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.red[400],
                          ));

                    }

                },
              ),
              SizedBox(height: size.height*0.02,),
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
              SizedBox(height: size.height*0.02,),

              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPassword()));
              },
                child: Text("Forget Password ?",
                  style: TextStyle(color: Color(0xFF36A4F8),decoration: TextDecoration.underline,),
                ),
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
              SizedBox(height: size.height*0.01,),
            ],
          ),
        ),
      ),
    )
    );
  }
}










