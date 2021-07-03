
import 'package:cookbook_recipe/models/Recipe/RecipeBundle.dart';
import 'package:cookbook_recipe/models/Recipe/RecipeBundleCard.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:cookbook_recipe/size_config.dart';



class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: <Widget>[

             Expanded(
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 1.5,),
                 child: GridView.builder(physics: BouncingScrollPhysics(),
                   clipBehavior: Clip.hardEdge,
                 itemCount: recipeBundles.length,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: SizeConfig.orientation == Orientation.landscape ? 2:1,
                 crossAxisSpacing: SizeConfig.orientation == Orientation.landscape ? SizeConfig.defaultSize *3 : 1,
                 mainAxisSpacing: 15,
                 childAspectRatio: 1.7,
                  ),
                   itemBuilder: (context, index) => RecipeBundleCard(recipeBundle: recipeBundles[index],
                   press: () {},
                   ),

             ),
               ),
             ),

          ],
        ),
      ),
    );
  }
}





