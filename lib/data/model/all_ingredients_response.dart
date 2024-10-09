class AllIngredientsResponse {
  List<IngredientNetworkModel>? meals;

  AllIngredientsResponse({this.meals});

  AllIngredientsResponse.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <IngredientNetworkModel>[];
      json['meals'].forEach((v) {
        meals!.add(IngredientNetworkModel.fromJson(v));
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

class IngredientNetworkModel {
  String? idIngredient;
  String? strIngredient;
  String? strDescription;
  String? strType;

  IngredientNetworkModel(
      {this.idIngredient,
      this.strIngredient,
      this.strDescription,
      this.strType});

  IngredientNetworkModel.fromJson(Map<String, dynamic> json) {
    idIngredient = json['idIngredient'];
    strIngredient = json['strIngredient'];
    strDescription = json['strDescription'];
    strType = json['strType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idIngredient'] = idIngredient;
    data['strIngredient'] = strIngredient;
    data['strDescription'] = strDescription;
    data['strType'] = strType;
    return data;
  }

  IngredientDomainModel toDomainModel() => IngredientDomainModel(
        id: idIngredient!,
        name: strIngredient!,
        description: strDescription ?? "",
        hdImageUrl:
            "https://www.themealdb.com/images/ingredients/$strIngredient.png",
        smallImageUrl:
            "https://www.themealdb.com/images/ingredients/$strIngredient-Small.png",
      );
}

class IngredientDomainModel {
  final String id;
  final String name;
  final String description;
  final String hdImageUrl;
  final String smallImageUrl;

  IngredientDomainModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.hdImageUrl,
      required this.smallImageUrl});
}
