# party_san

A Flutter app to manage your festival. Feel free to fork and change it for your need.

## How to build

`flutter run`

## How to release

Inc build number
 
`flutter build apk --release`

Upload to playstore and inc build number

`flutter build apk --release --target-platform=android-arm64`

Upload to playstore.

## How to regenerate app icons

```
flutter pub get
flutter pub pub run flutter_launcher_icons:main
```