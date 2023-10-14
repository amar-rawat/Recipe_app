import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_api.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/pages/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.restaurant_menu),
          SizedBox(
            width: 10,
          ),
          Text('Food Recipe')
        ]),
      ),
      body: RecipeCard(
          title: 'My Recipe',
          ratings: '4.3',
          cookTime: '12 min',
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1676637000058-96549206fe71?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
    );
  }
}
