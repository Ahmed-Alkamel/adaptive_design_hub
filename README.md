# AdaptiveDesignHub

A flexible, framework-agnostic responsive design library for Flutter. Supports both `flutter_screenutil` and native responsive scaling, with robust extensions and theming.

## Features

- **Dual Mode**: seamlessly switch between `flutter_screenutil` (default) and native `MediaQuery` scaling.
- **Dual Access**: Access responsive values via context (`context.w(10)`) or globally (`10.w`).
- **Rich Extensions**: 
  - `num` extensions (`.w`, `.h`, `.r`, `.sp`)
  - `Widget` extensions (`.p`, `.px`, `.center`, `.expand`, etc.)
  - `EdgeInsets` extensions (`.r`)
- **Theming**: Integrated theme system for consistent colors and spacing.

## Getting Started

Add dependencies:

```yaml
dependencies:
  adaptive_design_hub:
    path: ./ # Or git/pub source
  flutter_screenutil: ^5.9.0 # Required if using ScreenUtil mode
```

## Usage

### 1. Initialization

#### Method A: Using ScreenUtil (Recommended)

Wrap your `MaterialApp` with `ScreenUtilInit` and initialize `AdaptiveDesignHub`.

```dart
import 'package:adaptive_design_hub/adaptive_design_hub.dart';

void main() {
  // Initialize AdaptiveDesignHub (defaults to useScreenUtil: true)
  AdaptiveDesignHub().init();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          home: HomePage(),
        );
      },
    );
  }
}
```

#### Method B: Native Mode (No Context/ScreenUtil)

Initializes a native adapter that uses `PlatformDispatcher` for global sizing fallback.

```dart
void main() {
  AdaptiveDesignHub().init(
    useScreenUtil: false,
    designSize: const Size(375, 812),
  );
  runApp(MyApp());
}
```

### 2. Responsive Values

```dart
// Num Extensions
Container(
  width: 100.w,    // Adaptive width
  height: 50.h,    // Adaptive height
  radius: 10.r,    // Adaptive radius
);

Text(
  'Hello',
  style: TextStyle(fontSize: 16.sp), // Adaptive font size
);
```

### 3. Widget Shortcuts

```dart
// Padding & Layout
Text('Hello')
  .p(16)           // Padding.all(16.w)
  .center          // Center(child: ...)
  .safeArea;       // SafeArea(child: ...)
```

### 4. Context Extensions

```dart
build(BuildContext context) {
  return Container(
    color: context.adaptiveColors.primary,
    width: context.w(100), // Explicit context-based calc
    child: Text(
       'Width: ${context.screenWidth}',
       style: context.textTheme.headlineLarge,
    ),
  );
}
```

## Custom Theme

```dart
AdaptiveDesignHub().init(
  theme: AdaptiveTheme(
    colors: AdaptiveColors(
      primary: Colors.purple,
    ),
  ),
);
```
