import 'package:flutter/material.dart';
import 'package:recipes_app/PrincipalScreen.dart';
import 'package:recipes_app/Recipe.dart';

void main() => runApp(App());


final List<Widget> recipes = [
  RecipeWidget(
    nameOfRecipe: "Pizza",
    imageURL: "assets/img/Pizza.png",
    onTap: () => debugPrint("Edit pizza"),
    data: [
      ["SUGAR", "23", "grs"],
      ["PROCNT", "12", "grs"],
    ],
  ),
  RecipeWidget(
      nameOfRecipe: "Pizza 2",
      imageURL: "assets/img/Pizza.png",
      onTap: () => debugPrint("Edit pizza 2"),
      data: [
        ["SUGAR", "23", "grs"],
        ["PROCNT", "12", "grs"],
      ],
  ),

  RecipeWidget(
    nameOfRecipe: "Pizza 3",
    imageURL: "assets/img/Pizza.png",
    onTap: () => debugPrint("Edit pizza 2"),
    data: [
      ["SUGAR", "23", "grs"],
      ["FAT", "12", "g"],
    ],
  ),

  RecipeWidget(
    nameOfRecipe: "Pizza 4",
    imageURL: "assets/img/Pizza.png",
    onTap: () => debugPrint("Edit pizza 2"),
    data: [
      ["CHOCDF", "23", "g"],
      ["PROCNT", "12", "grs"],
    ],
  ),

  RecipeWidget(
    nameOfRecipe: "Pizza 5",
    imageURL: "assets/img/Pizza.png",
    onTap: () => debugPrint("Edit pizza 2"),
    data: [
      ["SUGAR", "23", "kcal"],
      ["FAT", "12", "grs"],
    ],
  ),


];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      title: 'Recipes',
      home: PrincipalScreen(
        recipes: recipes,
        onAdd: () => debugPrint("Add elements"),
      ),
    );
  }
}
