import 'package:flutter/material.dart';

class RecipeBundle{
  final int id, chefs, recipes;
  final String title, description, imageSrc;
  final Color color, divider_color;

  RecipeBundle({
    this.id,
    this.chefs,
    this.recipes,
    this.title,
    this.description,
    this.imageSrc,
    this.color,
    this.divider_color,
  });
}


List<RecipeBundle> recipeBundles = [

  RecipeBundle(
    id: 1,
    chefs: 36,
    recipes: 39,
    title: "Cook North Indian!! today",
    description: "Now you can cook New North Indian dishes every minute",
    imageSrc: "assets/images/indian_thali.png",
    color: Colors.blue,
    divider_color: Color(0xFF7CFF02),
  ),
  RecipeBundle(
    id: 2,
    chefs: 16,
    recipes: 19,
    title: "Cook Something New!! today",
    description: "now we cook new  owsome dishes every minute",
    imageSrc: "assets/images/Hamburger-pana.png",
    color: Color(0xFF90AF17),
    divider_color: Color(0xFFDB001E),

  ),
  RecipeBundle(
    id: 3,
    chefs: 26,
    recipes: 29,
    title: "Cook South Indian!! today",
    description: "Now you can cook New South Indian dishes every minute",
    imageSrc: "assets/images/south indian food.png",
    color: Color(0xFFD82D40),
    divider_color: Color(0xFFBDAB00),
  ),

  RecipeBundle(
    id: 4,
    chefs: 46,
    recipes: 49,
    title: "COOk Something owsone today",
    description: "now we cook new  owsome dishes every minute",
    imageSrc: "assets/images/kisspng_chicken_tikka.png",
    color: Color(0xFF9A09EA),
    divider_color: Color(0xFFAAAF0B),
  ),


];