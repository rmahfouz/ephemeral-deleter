# ephemeral-deleter
fix deleting ephemeral error in flutter

If you encounter an issue where Flutter fails to delete a directory (such as `build\flutter_assets` or `ephemeral`) when trying to build or debug the app after it was already started and closed, you can use the included `force_clean.bat` script.

**The Problem:**
Sometimes, Dart or Java processes keep a lock on build directories (like `build/` or `.dart_tool/`). This prevents Flutter from properly cleaning the old files before a new build, resulting in a permission or access error.

**The Solution (`force_clean.bat`):**
This script forces a strict cleanup of the environment to resolve the locks:

1. **Terminates Locking Processes:** Forcibly stops any lingering `dart.exe` and `java.exe` background processes that may be locking the files.
2. **Deletes Build Artifacts:** Manually deletes the `build`, `.dart_tool` directories, and the `pubspec.lock` file to ensure a clean slate.
3. **Runs `flutter clean`:** Executes the standard Flutter clean command to clear out the remaining caches.
4. **Fetches Dependencies:** Automatically runs `flutter pub get` to download fresh dependencies.

**How to Use:**
> **Note:** Ensure that `force_clean.bat` is kept in the main (root) folder of your project, as it looks for directories like `build` and `.dart_tool` relative to its location.

1. Open your terminal or command prompt in the project root directory.
2. Run the script:
   ```cmd
   force_clean.bat
   ```
3. Once completed, you can safely run `flutter run` or `flutter build` again without directory lock issues.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
