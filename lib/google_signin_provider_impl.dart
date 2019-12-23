import 'package:auth_provider/auth_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider implements AuthProvider {
  final GoogleSignIn googleSignIn;
  SessionStorage sessionStorage;

  GoogleSignInProvider({this.googleSignIn, this.sessionStorage});

  @override
  Future<bool> cacheSessionData(Map<String, dynamic> sessionData) {
    return sessionStorage.set("sessionData", sessionData);
  }

  @override
  Future<bool> logout() async {
    await googleSignIn.signOut();
    await sessionStorage.clearData();
    return true;
  }

  @override
  Future<Map<String, dynamic>> retrieveSessionData() {
    return sessionStorage.get("sessionData");
  }

  @override
  Future<Map<String, dynamic>> signIn({String id, String password}) async {
    final userAccount = await googleSignIn.signIn();
    if (userAccount == null) {
      throw GoogleSignInCancelledException();
    }
    final auth = await userAccount.authentication;
    return {
      "auth": {
        "auth_token": auth.accessToken,
        "id_token": auth.idToken,
        "hash_code": auth.hashCode,
      },
      "profile": {
        "display_name": userAccount.displayName,
        "email": userAccount.email,
        "photo_url": userAccount.photoUrl,
      }
    };
  }

  @override
  Future<Map<String, dynamic>> verifyPassword({String password}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> isSessionActive() async {
    final sessionData = await retrieveSessionData();
    return sessionData != null;
  }

  @override
  Future<Map<String, dynamic>> fetchAdditionalData({
    Map<String, dynamic> authToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> signUp({Map<String, dynamic> data}) {
    throw UnimplementedError();
  }
}

class GoogleSignInCancelledException implements Exception {}
