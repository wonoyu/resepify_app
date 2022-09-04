import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resepify_app/src/modules/home/data/home_repository.dart';
import 'package:resepify_app/src/modules/home/model/food_model.dart';

class FoodsController extends StateNotifier<AsyncValue<FoodModel>> {
  FoodsController({required this.homeRepository})
      : super(AsyncValue.data(FoodModel(foods: [], error: null)));

  final HomeRepository homeRepository;

  Future<void> searchFoods(FoodBody body) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => homeRepository.searchFoods(body));
  }
}

final foodsControllerProvider =
    StateNotifierProvider<FoodsController, AsyncValue<FoodModel>>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return FoodsController(homeRepository: homeRepository);
});
