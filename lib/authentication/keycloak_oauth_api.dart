import 'package:flutter_samen_grondwater_meten/authentication/secure_auth_storage.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;
import 'dart:io' show Platform;

import 'package:flutter_samen_grondwater_meten/config/app_config.dart';

class KeyCloakOAuthApi extends simpleAuth.OAuthApi {

  KeyCloakOAuthApi()
      : super(
      AppConfig.OAuthIdentifier,
      AppConfig.OAuthClientId,
      AppConfig.OAuthClientSecret,
      AppConfig.OAuthTokenUrl,
      AppConfig.OAuthAuthorizationUrl,
      AppConfig.OAuthRedirectUrl,
      scopes: [""],
      authStorage: SecureAuthStorage()
  ) {}

  @override
  simpleAuth.Authenticator getAuthenticator() => KeyCloakAuthenticator(identifier, clientId,
      clientSecret, tokenUrl, authorizationUrl, redirectUrl, scopes);
}

class KeyCloakAuthenticator extends simpleAuth.OAuthAuthenticator {

  KeyCloakAuthenticator(String identifier, String clientId, String clientSecret,
      String tokenUrl, String baseUrl, String redirectUrl, List<String> scopes)
      : super(identifier, clientId, clientSecret, tokenUrl, baseUrl,
      redirectUrl) {
    this.scope = scopes;

    // Use an embedded browser in Android
    // (because the regular browser does not return to app).
    if (Platform.isAndroid) {
      useEmbeddedBrowser = true;
    }
  }
}