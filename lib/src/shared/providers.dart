import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:resepify_app/src/shared/constants/tokens.dart';

final oauth2ClientProvider = Provider<oauth2.Client>((ref) {
  throw UnimplementedError();
});

final uriProvider =
    Provider<Uri>((ref) => Uri(scheme: scheme, host: baseUrl, path: endPoint));
