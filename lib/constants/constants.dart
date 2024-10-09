import 'package:flutter/material.dart';

String baseUrl = "https://www.themealdb.com/api/json/v1/1";

String getAllCategoriesUrl = "$baseUrl/categories.php";

String mealsByCategoryUrl = "$baseUrl/filter.php?c=";

String mealsByIngredientUrl = "$baseUrl/filter.php?i=";

String mealsByAreaUrl = "$baseUrl/filter.php?a=";

String getFullMealByIdUrl = "$baseUrl/lookup.php?i=";

String getAllIngredientsUrl = "$baseUrl/list.php?i=list";

String getAllAreasUrl = "$baseUrl/list.php?a=list";

String getSearchResultsUrl= "$baseUrl/search.php?s=";

const gridDelegate =
    SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 250);

const areasToSymbolMap = {
  "American": "us",
  "British": "gb",
  "Canadian": "ca",
  "Chinese": "cn",
  "Croatian": "hr",
  "Dutch": "nl",
  "Egyptian": "eg",
  "Filipino": "ph",
  "French": "fr",
  "Greek": "gr",
  "Indian": "in",
  "Irish": "ie",
  "Italian": "it",
  "Jamaican": "jm",
  "Japanese": "jp",
  "Kenyan": "kn",
  "Malaysian": "my",
  "Mexican": "mx",
  "Moroccan": "ma",
  "Polish": "pl",
  "Portuguese": "pt",
  "Russian": "sk",
  "Spanish": "es",
  "Thai": "th",
  "Tunisian": "tn",
  "Turkish": "tr",
  "Ukrainian": "UA",
  "Unknown": "Unknown",
  "Vietnamese": "vn"
};
