import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_api.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/pages/widgets/recipe_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes = await RecipeApi.getRecipe();
    return recipes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Food Recipe')
          ]),
        ),
        body: FutureBuilder(
          future: getRecipes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ListView.builder(
                  itemCount: (snapshot.data as List<Recipe>).length,
                  itemBuilder: (BuildContext context, int index) => RecipeCard(
                    title: (snapshot.data as List<Recipe>)[index].name,
                    ratings: (snapshot.data as List<Recipe>)[index]
                        .rating
                        .toString(),
                    cookTime: (snapshot.data as List<Recipe>)[index].totalTime,
                    imageUrl: (snapshot.data as List<Recipe>)[index].images,
                  ),
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ));
  }
}
