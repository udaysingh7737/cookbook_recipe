import 'package:cookbook_recipe/models/Recipe/Recipe.dart';
import 'package:cookbook_recipe/models/Recipe/RecipeBundle.dart';
import 'package:flutter/material.dart';
import 'package:cookbook_recipe/size_config.dart';
import 'package:flutter_svg/svg.dart';


class RecipeBundleCard extends StatelessWidget {
  final RecipeBundle recipeBundle;
  final Function press;

  const RecipeBundleCard({Key key, this.recipeBundle, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaulSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: (){Navigator.push(context,
          MaterialPageRoute(builder: (context) => Recipe_Detail())
      );
      },
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle.color,
          borderRadius: BorderRadius.circular((defaulSize * 1.8),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(child: Padding(
              padding: EdgeInsets.only(left: defaulSize * 2.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(),

                  Text(recipeBundle.title,
                    style: TextStyle(
                      fontSize: defaulSize * 2.5,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: defaulSize * 0.5,),
                  FittedBox(
                    child: Text(recipeBundle.description,
                      style: TextStyle(color: Colors.white60,
                        fontSize: defaulSize * 1.5,),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(color: recipeBundle.divider_color,),

                  Padding(
                    padding: const EdgeInsets.only(left:3.0),
                    child: buildInfoRow(defaulSize,
                        iconSrc: "assets/icons/chef.svg",
                        text: "${recipeBundle.chefs} ChefS"
                    ),
                  ),
                  SizedBox(height: defaulSize*0.5,),
                  buildInfoRow(defaulSize,
                      iconSrc: "assets/icons/pot.svg",
                      text: "${recipeBundle.recipes} Recipes"
                  ),
                  Spacer(),


                ],
              ),
            )
            ),


            AspectRatio(aspectRatio:0.85,
                child:Image.asset(recipeBundle.imageSrc,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,)
            )],
        ),
      ),
    );
  }

  Row buildInfoRow(double defaulSize, {String iconSrc, text}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(iconSrc),
        SizedBox(width: defaulSize),
        Text(
          text,
          style: TextStyle(color: Colors.yellow[200]),
        ),

      ],
    );
  }
}