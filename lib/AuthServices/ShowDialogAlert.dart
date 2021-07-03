import 'package:cookbook_recipe/utils/Util_Constants.dart';
import 'package:flutter/material.dart';

class ShowDialogAlert extends StatefulWidget {
  @override
  ShowDialogAlertState createState() => ShowDialogAlertState();
}

class ShowDialogAlertState extends State<ShowDialogAlert> {


  Future<void> showSignInDialog() async {
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
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/login",
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
