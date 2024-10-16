class MealsByCategoryResponse {
  List<Meal>? meals;

  MealsByCategoryResponse({this.meals});

  MealsByCategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Meal>[];
      json['meals'].forEach((v) {
        meals!.add(Meal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meal {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meal({this.strMeal, this.strMealThumb, this.idMeal});

  Meal.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strMeal'] = strMeal;
    data['strMealThumb'] = strMealThumb;
    data['idMeal'] = idMeal;
    return data;
  }
}
