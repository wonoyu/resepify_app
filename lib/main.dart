import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resepify_app/src/modules/authentication/data/auth_repo_impl.dart';
import 'package:resepify_app/src/modules/authentication/data/auth_repository.dart';
import 'package:resepify_app/src/modules/home/data/home_repo_impl.dart';
import 'package:resepify_app/src/modules/home/data/home_repository.dart';
import 'package:resepify_app/src/resepify_app.dart';
import 'package:resepify_app/src/shared/constants/tokens.dart';
import 'package:resepify_app/src/shared/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final client = await _createClient();
  runApp(ProviderScope(overrides: [
    authRepositoryProvider.overrideWithValue(AuthRepoImpl()),
    oauth2ClientProvider.overrideWithValue(client),
    homeRepositoryProvider.overrideWithProvider(homeRepoImplProvider),
  ], child: const ResepifyApp()));
}

Future<oauth2.Client> _createClient() async {
  final path = await _localPath;
  File credentialsFile = File('$path/credentials.json');
  final exists = await credentialsFile.exists();
  if (exists) {
    final credentials =
        oauth2.Credentials.fromJson(await credentialsFile.readAsString());
    print("${credentials.accessToken}, body");
    return oauth2.Client(credentials, identifier: identifier, secret: secret);
  }

  final client = await oauth2.clientCredentialsGrant(
      Uri.parse(tokenUrl.toString()), identifier, secret,
      scopes: ['basic']);
  // print("${client.credentials.accessToken}, body");

  await credentialsFile.writeAsString(client.credentials.toJson());
  return client;
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
