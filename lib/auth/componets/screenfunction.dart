import 'package:cookbook_recipe/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final iconSrc;
  final Function press;
  const SocialIcon({
    Key key,
    @required this.iconSrc,this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(),
          shape: BoxShape.circle,

        ),
        child: SvgPicture.asset(iconSrc, height: size.height * 0.04,),
      ),
    );
  }
}


class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical:size.height * 0.032),
      width: size.width * 0.8,

      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(color: Color(0xFF5C0B9C),
            ),
          ),

          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("OR",
              style: TextStyle(color: kPrimaryColor2,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Divider(color: Color(0xFF5C0B9C),
            ),
          ),
        ],
      ),
    );
  }
}


class TextFieldContainer extends StatelessWidget {
  //final color,text;
  final Widget child;

  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      height: 60,
      decoration: BoxDecoration(color: Color(0xFFE5CCFF),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}



