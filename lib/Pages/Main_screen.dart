import 'package:flutter/material.dart';
import 'package:recipes/Model/Recipe.dart';
import 'package:recipes/Pages/CategoryPage.dart';
import 'package:recipes/Pages/TagsPage.dart';

class MainScreen extends StatefulWidget {
  final List<Recipe> favoriteList;
  MainScreen({Key? key, required this.favoriteList}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState(this.favoriteList);
}

class MainScreenState extends State<MainScreen> {

  final favoriteList;
  final RecipeData recipeData = RecipeData();
  MainScreenState(this.favoriteList);
  List<Recipe> favoriteRecipes = [];

  @override
  void initState() {
    super.initState();
    favoriteRecipes = favoriteList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Додаток з рецептами'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade500
      ) ,
      body: ListView.builder(
          itemCount: recipeData.categoryDataList.length,
          itemBuilder: (BuildContext context, int index){
            return Center(

              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                    children: <Widget>[

                      Text(recipeData.categoryDataList[index].categoryName, style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.asset(recipeData.categoryDataList[index].image, width: MediaQuery.of(context).size.width * 0.7,),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CategoryPage(
                                          categoryName: recipeData.categoryDataList[index].categoryName,
                                          favoriteList: favoriteRecipes,
                                        )
                                )
                            );
                          },
                          child: Text('Перейти до категорії')),
                      Padding(padding: EdgeInsets.only(top: 10),),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TagsPage(
                                          favoriteList: favoriteRecipes,
                                        )
                                )
                            );
                          },
                          child: Text('Пошук за тегами')),
                      Padding(padding: EdgeInsets.only(top: 20),),
                    ]
                ),
              ),
            );
          }
      ),
    );
  }
}
