import 'package:cookbook_recipe/constants.dart';
import 'package:cookbook_recipe/models/profile/UserInfo/User_Info.dart';
import 'package:cookbook_recipe/size_config.dart';
import 'package:flutter/material.dart';


class Info extends StatelessWidget {
  const Info({
    Key key,

    this.name,
    this.email,
    this.image,
  }) : super(key: key);

  final String name,email,image;

  @override
  Widget build(BuildContext context) {
    double defualtSize = SizeConfig.defaultSize;
    return SizedBox(
      height: defualtSize * 24,
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: defualtSize * 15,
                color: kPrimaryColor1,
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Container(margin: EdgeInsets.only(bottom: defualtSize),
                    height: defualtSize*14,
                    width: defualtSize*20,
                    decoration: BoxDecoration(shape: BoxShape.circle,
                      border: Border.all(color: Colors.white,
                      width: defualtSize * 0.5,),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(image),

                      )
                    ),
                  ),

                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => User_info()));
                  },
                    child: Text(name,
                    style: TextStyle(
                      fontSize: defualtSize*2.2,
                      color: kPrimaryColor1,
                    ),
                    ),
                  ),
                  SizedBox(height: defualtSize /2),

                  Text(email,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}

class CustomShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path  = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width/ 2 , height, width,height-100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }
}
