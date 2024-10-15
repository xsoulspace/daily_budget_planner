// ignore_for_file: avoid_print

import 'dart:io';

Future<void> addRustoreAndroidScheme() async {
  final manifestPath = await _getManifestPath();
  final manifestFile = File(manifestPath);

  if (!manifestFile.existsSync()) {
    print('Error: AndroidManifest.xml not found at $manifestPath');
    return;
  }

  final appScheme = await _getAppScheme();

  if (appScheme.isEmpty) {
    print('Error: App scheme cannot be empty');
    return;
  }

  final intentFilter = '''
            <intent-filter>
                <action android:name="android.intent.action.VIEW"/>
                <category android:name="android.intent.category.DEFAULT"/>
                <category android:name="android.intent.category.BROWSABLE"/>
                <data android:scheme="$appScheme"/>
            </intent-filter>''';

  final manifestContent = await manifestFile.readAsString();

  if (manifestContent.contains(appScheme)) {
    print(
      'The scheme $appScheme is already present in the AndroidManifest.xml',
    );
    return;
  }

  final updatedContent = manifestContent.replaceFirst(
    '</intent-filter>',
    '</intent-filter>\n$intentFilter',
  );

  await manifestFile.writeAsString(updatedContent);

  print('Script completed successfully!');
}

Future<String> _getManifestPath() async {
  const defaultPath = 'android/app/src/main/AndroidManifest.xml';
  stdout.write('Enter the path to AndroidManifest.xml [$defaultPath]: ');
  final customPath = stdin.readLineSync()?.trim();
  return customPath?.isNotEmpty == true ? customPath! : defaultPath;
}

Future<String> _getAppScheme() async {
  while (true) {
    stdout.write(
      "Enter your app's scheme (e.g., ru.package.name.rustore.scheme): ",
    );
    final appScheme = stdin.readLineSync()?.trim() ?? '';
    if (appScheme.isNotEmpty) return appScheme;
    print('Error: App scheme cannot be empty');
  }
}

void main(final List<String> args) async => await addRustoreAndroidScheme();
