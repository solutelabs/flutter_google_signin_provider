library flutter_google_signin;

import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_google_signin/google_signin_provider_impl.dart';
import 'package:google_sign_in/google_sign_in.dart';

AuthProvider authProvider;

AuthProvider googleSignInProvider({
  @required List<String> scopes,
  SessionStorage sessionStorage,
}) {
  assert(scopes != null && scopes.isNotEmpty);
  authProvider ??= GoogleSignInProvider(
    googleSignIn: GoogleSignIn(scopes: scopes),
    sessionStorage: sessionStorage ?? defaultSessionStorage,
  );
  return authProvider;
}
