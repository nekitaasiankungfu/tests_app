# Deployment Guide

## Build Configuration

### Android Builds

#### Debug Build
```bash
flutter build apk --debug
```

**Output:** `build/app/outputs/flutter-apk/app-debug.apk`

**Use Case:** Development and testing

---

#### Release Build
```bash
flutter build apk --release --obfuscate --split-debug-info=./debug-info
```

**Output:** `build/app/outputs/flutter-apk/app-release.apk`

**Use Case:** Production release, sideloading

---

#### App Bundle (Recommended for Play Store)
```bash
flutter build appbundle --release --obfuscate --split-debug-info=./debug-info
```

**Output:** `build/app/outputs/bundle/release/app-release.aab`

**Use Case:** Google Play Store submission

**Benefits:**
- Smaller download size (dynamic delivery)
- Automatic APK generation per device config
- Google Play optimization

---

### iOS Builds

#### Debug Build
```bash
flutter build ios --debug
```

**Use Case:** Development and simulator testing

---

#### Release Build
```bash
flutter build ios --release --obfuscate --split-debug-info=./debug-info
```

**Use Case:** App Store submission, TestFlight

**Additional Steps:**
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select "Product" → "Archive"
3. Upload to App Store Connect

---

## Version Numbering

**Current Version:** 1.0.0+1

**Format:** `MAJOR.MINOR.PATCH+BUILD_NUMBER`

### Semantic Versioning

| Component | When to Increment | Example |
|-----------|------------------|---------|
| **MAJOR** | Breaking changes, major rewrites | 1.0.0 → 2.0.0 |
| **MINOR** | New features (backward compatible) | 1.0.0 → 1.1.0 |
| **PATCH** | Bug fixes, minor changes | 1.0.0 → 1.0.1 |
| **BUILD** | Every build (incremental) | 1.0.0+1 → 1.0.0+2 |

### Update Version

Edit `pubspec.yaml`:
```yaml
version: 1.0.1+2  # MAJOR.MINOR.PATCH+BUILD_NUMBER
```

---

## Release Checklist

### Pre-Release

- [ ] **Version Update:** Increment version in `pubspec.yaml`
- [ ] **Changelog:** Update `CHANGELOG.md` with changes
- [ ] **Tests:** Run `flutter test` - all tests must pass
- [ ] **Analysis:** Run `flutter analyze` - zero issues
- [ ] **Dependencies:** Run `flutter pub outdated` - review updates
- [ ] **Code Review:** Peer review of changes
- [ ] **Documentation:** Update README and docs if needed

### Build & Test

- [ ] **Android Debug:** Build and test on emulator
- [ ] **Android Release:** Build release APK
- [ ] **iOS Debug:** Build and test on simulator
- [ ] **iOS Release:** Build release for device
- [ ] **Physical Devices:** Test on real Android device
- [ ] **Physical Devices:** Test on real iOS device
- [ ] **Regression Testing:** Verify critical user flows

### App Store Specific

#### Google Play Store

- [ ] **Screenshots:** Prepare 2-8 screenshots per device type
- [ ] **Feature Graphic:** 1024x500 banner image
- [ ] **App Icon:** 512x512 PNG
- [ ] **Privacy Policy:** URL to privacy policy
- [ ] **Content Rating:** Complete questionnaire
- [ ] **App Category:** Select appropriate category
- [ ] **Pricing:** Set free/paid status
- [ ] **Release Notes:** Write user-facing changelog

#### Apple App Store

- [ ] **Screenshots:** Prepare for all required device sizes
- [ ] **App Preview:** Optional video (15-30 seconds)
- [ ] **App Icon:** 1024x1024 PNG
- [ ] **Privacy Policy:** URL to privacy policy
- [ ] **Age Rating:** Complete questionnaire
- [ ] **App Category:** Primary and secondary
- [ ] **Pricing:** Set pricing tier
- [ ] **What's New:** Write user-facing changelog
- [ ] **App Review Info:** Contact info and notes

### Security

- [ ] **Obfuscation:** Enabled for release builds
- [ ] **API Keys:** No hardcoded secrets
- [ ] **Permissions:** Minimal required permissions
- [ ] **Network Security:** HTTPS only (if applicable)
- [ ] **Data Encryption:** Sensitive data encrypted

### Post-Release

- [ ] **Monitor:** Check for crash reports
- [ ] **User Feedback:** Review store ratings/reviews
- [ ] **Analytics:** Monitor usage metrics
- [ ] **Hotfix Ready:** Be prepared to patch critical bugs

---

## Build Commands Reference

### Common Commands

```bash
# Clean build artifacts
flutter clean

# Get dependencies
flutter pub get

# Analyze code
flutter analyze

# Run tests
flutter test

# Format code
dart format lib/

# Check outdated packages
flutter pub outdated

# Update dependencies
flutter pub upgrade
```

### Platform-Specific

```bash
# Android - List devices
flutter devices

# Android - Run on specific device
flutter run -d <device-id>

# iOS - List simulators
xcrun simctl list devices

# iOS - Run on specific simulator
flutter run -d <simulator-id>
```

---

## Continuous Integration

### GitHub Actions Example

```yaml
name: Build & Test
on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.0.0'
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test --coverage
      - uses: codecov/codecov-action@v3

  build-android:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build apk --release

  build-ios:
    needs: test
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build ios --release --no-codesign
```

---

## Store Submission

### Google Play Console

1. **Create App:** Go to "All apps" → "Create app"
2. **App Details:** Fill in title, description, category
3. **Store Listing:** Upload screenshots, graphics
4. **Content Rating:** Complete questionnaire
5. **Pricing & Distribution:** Set countries and pricing
6. **App Content:** Privacy policy, ads declaration
7. **Release:** Upload AAB to "Production" track
8. **Review:** Submit for review (typically 1-3 days)

### Apple App Store Connect

1. **Create App:** Go to "My Apps" → "+" → "New App"
2. **App Information:** Bundle ID, name, category
3. **Pricing:** Set availability and pricing
4. **Version Information:** Screenshots, description
5. **Build:** Upload via Xcode or Transporter
6. **App Review Information:** Contact and notes
7. **Submit:** Submit for review (typically 1-3 days)

---

## Rollback Procedure

### Google Play Store

1. Go to "Production" → "Releases"
2. Click "Create new release" → "Rollback"
3. Select previous version
4. Confirm rollback

### Apple App Store

1. Go to "App Store" → "Distribution"
2. Click "+ Version or Platform"
3. Re-submit previous version
4. Expedite review if critical

---

## Debug Info Management

### Save Debug Symbols

```bash
# Android
flutter build apk --release \
  --obfuscate \
  --split-debug-info=./build-info/android/v1.0.0

# iOS
flutter build ios --release \
  --obfuscate \
  --split-debug-info=./build-info/ios/v1.0.0
```

### Upload to Crash Reporting

```bash
# Firebase Crashlytics example
firebase crashlytics:symbols:upload \
  --app=<app-id> \
  ./build-info/android/v1.0.0
```

---

## Environment Configuration

### Development
```bash
flutter run --debug
```

### Staging (if needed)
```bash
flutter run --profile
```

### Production
```bash
flutter run --release
```

---

**Last Updated:** 2025-11-08
**Current Version:** 1.0.0+1
**Next Release:** TBD
