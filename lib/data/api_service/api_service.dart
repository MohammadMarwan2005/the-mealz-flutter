import 'dart:convert';

import 'package:bloc_state_management/constants/constants.dart';
import 'package:bloc_state_management/core/filter_keyword_type.dart';
import 'package:bloc_state_management/data/model/all_areas_response.dart';
import 'package:bloc_state_management/data/model/all_categories_response.dart';
import 'package:bloc_state_management/data/model/all_ingredients_response.dart';
import 'package:bloc_state_management/data/model/full_meal_response.dart';
import 'package:bloc_state_management/data/model/meals_by_category_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<AllCategoriesResponse> getAllCategories() async {
    http.Response httpResponse = await http.get(Uri.parse(getAllCategoriesUrl));
    final Map<String, dynamic> jsonResponse = jsonDecode(httpResponse.body);
    final AllCategoriesResponse allCategoriesResponse =
        AllCategoriesResponse.fromJson(jsonResponse);
    return allCategoriesResponse;
  }

  Future<MealsByCategoryResponse> getMealsBy(
    String keyWord,
    FilterKeywordType type,
  ) async {
    final String? url;
    switch (type) {
      case FilterKeywordType.category:
        url = "$mealsByCategoryUrl$keyWord";
      case FilterKeywordType.ingredient:
        url = "$mealsByIngredientUrl$keyWord";
      case FilterKeywordType.area:
        url = "$mealsByAreaUrl$keyWord";
      default:
        url = "";
    }

    http.Response httpResponse = await http.get(Uri.parse(url));
    final Map<String, dynamic> jsonResponse = jsonDecode(httpResponse.body);
    final MealsByCategoryResponse result =
        MealsByCategoryResponse.fromJson(jsonResponse);
    return result;
  }

  Future<FullMealDomainModel> getFullMealDetails(int id) async {
    http.Response httpResponse =
        await http.get(Uri.parse("$getFullMealByIdUrl$id"));
    final Map<String, dynamic> jsonResponse = jsonDecode(httpResponse.body);
    final FullMealResponseModel result =
        FullMealResponseModel.fromJson(jsonResponse);
    return result.toDomainModel();
  }

  Future<List<IngredientDomainModel>> getAllIngredients() async {
    http.Response httpResponse =
        await http.get(Uri.parse(getAllIngredientsUrl));
    Map<String, dynamic> jsonResponse = jsonDecode(httpResponse.body);
    AllIngredientsResponse networkResponse =
        AllIngredientsResponse.fromJson(jsonResponse);
    return networkResponse.meals?.map((e) => e.toDomainModel()).toList() ?? [];
  }

  Future<List<AreaDomainModel>> getAllAreas() async {
    http.Response httpResponse = await http.get(Uri.parse(getAllAreasUrl));
    Map<String, dynamic> jsonResponse = jsonDecode(httpResponse.body);
    AllAreasResponse networkResponse = AllAreasResponse.fromJson(jsonResponse);
    return networkResponse.meals?.map((e) => e.toDomainModel()).toList() ?? [];
  }

  Future<List<FullMealDomainModel>> getSearchResultMeals(String keyword) async {
    http.Response httpResponse =
    await http.get(Uri.parse("$getSearchResultsUrl$keyword"));
    final Map<String, dynamic> jsonResponse = jsonDecode(httpResponse.body);
    final FullMealResponseModel result =
    FullMealResponseModel.fromJson(jsonResponse);
    return result.meals?.map((e) => e.toDomainModel()).toList() ?? [];
  }

}
