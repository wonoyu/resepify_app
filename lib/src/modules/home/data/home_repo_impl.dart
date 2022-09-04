import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resepify_app/src/modules/home/data/home_repository.dart';
import 'package:resepify_app/src/modules/home/model/food_model.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:resepify_app/src/shared/providers.dart';

class HomeRepoImpl implements HomeRepository {
  HomeRepoImpl({required this.client, required this.uri});

  final oauth2.Client client;
  final Uri uri;

  @override
  Future<FoodModel> searchFoods(FoodBody body) async {
    final response = await client.post(uri, body: body.toJson());
    print("${response.statusCode}, body");
    print("${response.body}, body");
    final result = FoodModel.fromJson(json.decode(response.body));
    return result;
  }
}

final homeRepoImplProvider = Provider<HomeRepository>((ref) {
  final client = ref.watch(oauth2ClientProvider);
  final uri = ref.watch(uriProvider);
  return HomeRepoImpl(client: client, uri: uri);
});
