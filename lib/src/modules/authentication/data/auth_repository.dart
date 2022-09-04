import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

abstract class AuthRepository {
  Future<oauth2.Client> createClient();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  throw UnimplementedError();
});
