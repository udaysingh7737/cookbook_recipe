
import 'package:cookbook_recipe/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileMenuBar extends StatelessWidget {
  const ProfileMenuBar({
    Key key,
    this.iconSrc,this.menuItem, this.press,this.color
  }) : super(key: key);

  final String iconSrc,menuItem;
  final Function press;
  final Color color;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double defualtSize = SizeConfig.defaultSize;
    return InkWell(onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defualtSize*2,vertical: defualtSize*2.5),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              SvgPicture.asset(iconSrc,height:size.height * 0.03,),
              SizedBox(width: defualtSize*2,),
              Text(menuItem,
                style: TextStyle(
                  fontSize: size.height* 0.022,
                  color: color,
                ),),

              Spacer(),


            ],
          ),
        ),
      ),
    );
  }
}