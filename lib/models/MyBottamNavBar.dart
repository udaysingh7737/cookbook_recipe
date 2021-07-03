import 'package:cookbook_recipe/constants.dart';
import 'package:cookbook_recipe/models/Navitem.dart';
import 'package:cookbook_recipe/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Consumer<NavItems>(
      builder:  (context, navItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: defaultSize * 3),
      height: 65,
        decoration:  BoxDecoration(color: Colors.white70,
        boxShadow: [BoxShadow(offset: Offset(0,-7),
        blurRadius: 30,
        color:Color(0xFF481A39).withOpacity(0.2))]
        ),

        child: SafeArea(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                navItems.items.length,
                    (index) => buildIconNavButton(
                  isActive: navItems.selectedIndex == index ? true : false,
                  icon: navItems.items[index].icon,
                  press: () {
                    navItems.chnageNavIndex(index: index);
                    // maybe destinationChacker is not needed in future because then all of our nav items have destination
                    // But Now if we click those which dont have destination then it shows error
                    // And this fix this problem
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => navItems.items[index].destination,),
                      );

                  },
                ),
              ),
            ),
        ),
      ),
    );
  }

  IconButton buildIconNavButton({String icon, Function press, bool isActive = false}) {
    return IconButton(
        icon: SvgPicture.asset(icon, color: isActive ? kPrimaryColor1 :Color(0xFFD1D4D4),
        height: 22,
        ),
        onPressed: press

            );
  }
}
