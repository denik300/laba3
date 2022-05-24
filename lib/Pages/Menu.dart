import 'package:flutter/material.dart';
import 'package:recipes/Pages/Main_screen.dart';
import 'package:recipes/Model/Recipe.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);
  List<Recipe> favoriteRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade500,
        appBar: AppBar(
          title: Text('Рецепти'),
          centerTitle: true,
        ),
        body: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MainScreen(favoriteList: favoriteRecipes,)

                      )
                  );
                },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade500),
                  ),
                  child: Text('На головну'),)
              ],
            )
          ],
        )
    );
  }
}
