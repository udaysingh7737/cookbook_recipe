import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    @required  this.child,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/main_top.png",
                width: size.width * 0.35,)
          ),
          /*Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
          ),

          TextFieldsContainer(
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person,
                ),
                hintText: "Your Email",
              ),
            ),
          ),

           */

          Positioned(
              bottom: 0,left: 0,
              child: Image.asset("assets/images/main_bottom.png", width: size.width * 0.25,)
          ),
          child,
        ],
      ),

    );
  }
}

class TextFieldsContainer extends StatelessWidget {
  final Widget child;
  final iconSrc, text;
  const TextFieldsContainer({
    Key key,
    this.iconSrc,this.text,this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
      width: size.width*0.85,height: size.height *0.1,
      decoration: BoxDecoration(
        color: Color(0xFFF6A6D2),
        borderRadius: BorderRadius.circular(29),
      ),
    );

  }
}
