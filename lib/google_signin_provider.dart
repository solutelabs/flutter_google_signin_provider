library google_signin_provider;

import 'package:auth_provider/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signin_provider/google_signin_provider_impl.dart';

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
