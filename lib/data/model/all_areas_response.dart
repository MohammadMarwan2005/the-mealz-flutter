import 'package:bloc_state_management/constants/constants.dart';

class AllAreasResponse {
  List<AreaNetwokModel>? meals;

  AllAreasResponse({this.meals});

  AllAreasResponse.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <AreaNetwokModel>[];
      json['meals'].forEach((v) {
        meals!.add(AreaNetwokModel.fromJson(v));
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

class AreaNetwokModel {
  String? strArea;

  AreaNetwokModel({this.strArea});

  AreaNetwokModel.fromJson(Map<String, dynamic> json) {
    strArea = json['strArea'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strArea'] = strArea;
    return data;
  }

  AreaDomainModel toDomainModel() =>
      AreaDomainModel(name: strArea ?? "No Name", imageUrl: getFlag());

  String getFlag() =>
      "https://www.themealdb.com/images/icons/flags/big/64/${areasToSymbolMap[strArea]}.png";
}

class AreaDomainModel {
  final String name;
  final String imageUrl;

  AreaDomainModel({required this.name, required this.imageUrl});
}
