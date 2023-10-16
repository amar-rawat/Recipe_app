import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:recipe_app/models/recipe_model.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {'limit': '18', 'start': '0'});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'adc9b1880bmshaecd1bbc9241e68p10ea61jsnb9b0a6916a37',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true'
    });

    Map data = jsonDecode(response.body);
    print(data);
    List _temp = [];
    for (var i in data['feed']) {
      if (i['content'] != null && i['content']['details'] != null) {
        _temp.add(i['content']['details']);
        if (_temp.length == 4) break;
      }
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
