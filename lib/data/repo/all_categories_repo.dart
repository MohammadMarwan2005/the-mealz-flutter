import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/model/all_categories_response.dart';

class AllCategoriesRepo {
  final ApiService apiService;

  AllCategoriesRepo({required this.apiService});

  Future<List<CategoryNetworkModel>> getAllCategories() async {
    final resposne = await apiService.getAllCategories();
    return resposne.categories!;
  }
}
