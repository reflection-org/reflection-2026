# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter web application for the "reflection 2026" event. It's a single-page scrolling website with multiple sections including an intro video, clock countdown, welcome messages, event information with map, and FAQ.

## Development Commands

### Setup
```bash
flutter pub get
```

### Code Generation
Assets are auto-generated using flutter_gen. Run this after adding new assets:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Running the App
```bash
flutter run -d chrome  # For web development
flutter run -d macos   # For macOS development
```

### Building
```bash
flutter build web --base-href "/reflection2026/"  # Production web build
```

### Testing
```bash
flutter test
```

### Linting
```bash
flutter analyze
```

## Architecture

### Page Structure

The app follows a feature-based architecture with a single scrolling page (MainPage) that composes multiple sections:

1. **MainPage** (`lib/feature/main/main_page.dart`): Root container with CustomScrollView
   - Manages scroll position and section tracking via ScrollController
   - Uses GlobalKeys to enable navigation to specific sections
   - Sections tracked via `Section` enum (introduce, map, faq)
   - Header component overlays the content with blur effect

2. **Page Sections** (in scroll order):
   - **IntroPage**: Video introduction
   - **ClockPage**: Countdown timer display
   - **SliverWelcomeMessagePage**: Scrolling welcome messages with custom delegate
   - **SliverInformationPage**: Event information with map component
   - **FaqPage**: Frequently asked questions
   - **Footer**: Bottom footer with links

### Asset Management

Uses `flutter_gen` to generate type-safe asset references. Generated code in `lib/gen/assets.gen.dart`.

Asset locations:
- Images: `assets/images/` (.webp, .png)
- Icons: `assets/icons/` (.svg)
- Videos: `assets/video/`

After adding new assets to these directories:
1. Ensure they're listed under `flutter.assets` in `pubspec.yaml`
2. Run `flutter pub run build_runner build --delete-conflicting-outputs`
3. Access via `Assets.images.*`, `Assets.icons.*`, `Assets.video.*`

### Shared Components

- **Header** (`lib/shared/ui/component/header/header.dart`): Sticky navigation with section highlights
- **Footer** (`lib/shared/ui/component/footer/footer.dart`): Contact and social links
- **CustomColor** (`lib/shared/ui/theme/custom_color.dart`): Color palette constants

### Styling

- Uses Google Fonts package with Pretendard font family
- Custom colors defined in `lib/shared/ui/theme/custom_color.dart`
- Responsive design via `responsive_builder` package
- Material 3 design system

## CI/CD

Auto-deploys to GitHub Pages on push to `master` branch (see `.github/workflows/cd.yaml`).
The workflow:
1. Checks out code
2. Sets up Flutter 3.35.0
3. Gets dependencies
4. Generates assets via build_runner
5. Builds web app with base-href
6. Deploys to gh-pages branch

## Key Dependencies

- `video_player`: Video playback in IntroPage
- `flutter_gen`: Type-safe asset code generation
- `flutter_svg`: SVG rendering for icons
- `google_fonts`: Custom typography
- `sliver_tools`: Advanced scrolling widgets
- `url_launcher`: External link handling
- `responsive_builder`: Responsive layout utilities
