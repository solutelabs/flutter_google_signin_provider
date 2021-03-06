# Google Sign-in Provider

An Implementation of Google sign-in based on [dart Auth provider](https://github.com/solutelabs/dart_auth_provider).

## Introduction
This packages is intended to easily integrate Google sign-in in Flutter based Application.

The package is responsible for the Google-Sign in and caching the session data. We can also provide a custom implementation of caching session data.


## Installation
**Step 1:** Add this package as a dependency in `pubspec.yaml` file.

```
flutter_google_signin:
    git:
      url: git@github.com:solutelabs/flutter_google_signin_provider.git
``` 

**Step 2:** Integrate Google-Sign in for Android and iOS. [Reference](https://pub.dev/packages/google_sign_in)

## Usage
```
import 'package:flutter_google_signin/google_signin_provider.dart';

...

await googleSignInProvider(scopes: ['email']).signIn();
```
