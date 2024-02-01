# blue_property

This project is using flutter.

# Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Useful commands

1. Before submit
   ```
   flutter clean
   rm -Rf build
   rm -Rf .dart_tool
   rm -Rf pubspec.lock
   cd ios
   rm -Rf ios/Pods
   rm -Rf ios/.symlinks
   rm -Rf ios/Flutter/Flutter.framework
   rm -Rf ios/Flutter/Flutter.podspec
   rm -Rf Podfile.lock
   cd ..
   ```
2. Run Project
   ```
   flutter clean
   rm -Rf build
   rm -Rf .dart_tool
   rm -Rf pubspec.lock
   cd ios
   rm -Rf ios/Pods
   rm -Rf ios/.symlinks
   rm -Rf ios/Flutter/Flutter.framework
   rm -Rf ios/Flutter/Flutter.podspec
   rm -Rf Podfile.lock
   flutter pub get
   pod install
   cd ..
   flutter run
   ```
3. To generate .g.dart
   ```
   flutter clean
   rm -Rf build
   rm -Rf .dart_tool
   rm -Rf pubspec.lock
   rm -Rf lib/models/*.g.dart
   cd ios
   rm -Rf ios/Pods
   rm -Rf ios/.symlinks
   rm -Rf ios/Flutter/Flutter.framework
   rm -Rf ios/Flutter/Flutter.podspec
   rm -Rf Podfile.lock
   flutter pub get
   pod install
   cd ..
   flutter pub run build_runner build —-delete-conflicting-outputs
   ```
4. To Run with mode
   ```
   flutter run --dart-define=ENV=dev
   ```
5. To Build Release iOS
   ```
   flutter build ios --release
   ```
6. To Build Release Android
   1. To Build Release APK With Code Obfuscation
      ```
      flutter build apk --release --split-per-abi --obfuscate --split-debug-info=./build/debug
      ```
   2. To Build Release AAB With Code Obfuscation
      ```
      flutter build appbundle --release --obfuscate --split-debug-info=./build/debug
      ```
   3. To Build Release APK
      ```
      flutter build apk --split-per-abi
      ```
   4. To Build Release AAB
      ```
      flutter build appbundle --release
      ```
7. To Generate gen-l10n
   ```
   flutter gen-l10n
   ```

# References

## App localization

There are two options. I choose the second option.

1.  [Flutter Localization By Seddiq Sorush](https://medium.com/@podcoder/flutter-localization-a39402757a42)
2.  [Offical - Internationalizing Flutter apps](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
    [Offical - Internationalization User Guide (PUBLICLY SHARED)](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/edit)
    [Country Code](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html)
3.  [Flutter Internationalization the Easy Way — using Provider and JSON](https://medium.com/flutter-community/flutter-internationalization-the-easy-way-using-provider-and-json-c47caa4212b2)

## Environment configuration

1. [Environment Configuration In Flutter App](https://stacksecrets.com/flutter/environment-configuration-in-flutter-app#:~:text=In%20order%20to%20load%20proper,which%20can%20set%20configuration%20dynamically.&text=Since%20the%20Environment%20class%20has,through%20out%20the%20application%20lifecycle.)
2. [Environment-Specific Configuration with Flutter](https://flutterigniter.com/env-specific-configuration/)

## Best practice

1. [Flutter Best Practice - Constants](https://aschilken.medium.com/flutter-best-practices-colors-and-textstyles-6e14b06fc3a1)

## Writing readme format syntax

1. [Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

## Generic Model

1. [Generic Model](https://wamae.medium.com/generics-and-json-serialization-in-flutter-a8d335840d7b)

## ListView

1. [Creating ListViews in Flutter](https://blog.logrocket.com/creating-listviews-in-flutter/)

## Tab Bottom and Router

1. [Flutter TabBar: A complete tutorial with examples](https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples/#:~:text=To%20implement%20TabBar%20in%20your,for%20most%20simple%20use%20cases.&text=Place%20the%20TabBar%20widget%20as,the%20body%20of%20the%20AppBar%20.)
2. [Flutter Case Study: Multiple Navigators with BottomNavigationBar](https://medium.com/coding-with-flutter/flutter-case-study-multiple-navigators-with-bottomnavigationbar-90eb6caa6dbf)
3. [Keep Bottom Navigation Bar across Page Route [Flutter]](https://www.youtube.com/watch?v=qj7jcuU2Z10)
4. [Clean Navigation in Flutter Using Generated Routes](https://medium.com/flutter-community/clean-navigation-in-flutter-using-generated-routes-891bd6e000df)
5. [Flutter: Keep BottomNavigationBar When Push to New Screen with Navigator](https://stackoverflow.com/questions/49628510/flutter-keep-bottomnavigationbar-when-push-to-new-screen-with-navigator)
6. [What is the use of `rootNavigator` in Navigator.of(context, rootNavigator: true).push();](https://stackoverflow.com/questions/60349741/what-is-the-use-of-rootnavigator-in-navigator-ofcontext-rootnavigator-true)

## Could not find meta data

1. [Couldn't find meta-data for provider with authority](https://stackoverflow.com/questions/56598480/couldnt-find-meta-data-for-provider-with-authority)
2. [Couldn't find meta-data for provider with authority](https://exchangetuts.com/couldnt-find-meta-data-for-provider-with-authority-1639577767476314)

## Hide screen app background

1. [How to hide app preview when switching apps, with Flutter.](https://medium.com/@carlo.log/how-to-hide-app-preview-when-switching-apps-with-flutter-6afcefe83ee5)
2. [Securing Your Flutter App: Implementing a Privacy Screen.](https://articles.wesionary.team/securing-your-flutter-app-implementing-a-privacy-screen-61383ce09f0a)

## Check Emulator or Physical Device

1. [How do I check if a device is an emulator or a physical device?](https://stackoverflow.com/questions/61476797/how-do-i-check-if-a-device-is-an-emulator-or-a-physical-device)

## Jailbreak Detection

1. [Flutter — How to check for rooted or jailbroken devices.](https://medium.com/@carlo.log/flutter-how-to-check-for-rooted-or-jailbroken-devices-b80769deba3a)

