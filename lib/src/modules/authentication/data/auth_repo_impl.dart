import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:resepify_app/src/modules/authentication/data/auth_repository.dart';
import 'package:resepify_app/src/shared/constants/tokens.dart';

class AuthRepoImpl implements AuthRepository {
  @override
  Future<oauth2.Client> createClient() async {
    final credentialsFile =
        File('/home/ahmad/Work/side-projects/resepify_app/credentials.json');
    final exists = await credentialsFile.exists();
    if (exists) {
      final credentials =
          oauth2.Credentials.fromJson(await credentialsFile.readAsString());
      return oauth2.Client(credentials, identifier: identifier, secret: secret);
    }

    final client = await oauth2.clientCredentialsGrant(
        Uri.parse(dotenv.env['ACCESS_TOKEN_URL'].toString()),
        identifier,
        secret,
        scopes: ['basic']);

    await credentialsFile.writeAsString(client.credentials.toJson());
    return client;
  }
}
