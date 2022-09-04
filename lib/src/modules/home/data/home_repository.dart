import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resepify_app/src/modules/home/model/food_model.dart';

abstract class HomeRepository {
  Future<FoodModel> searchFoods(FoodBody body);
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  throw UnimplementedError();
});
