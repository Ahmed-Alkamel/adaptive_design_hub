# AdaptiveDesignHub: AI & Agent Developer Guide

> **Role Definition**: When using this library, act as an expert UI engineer specializing in responsive Flutter development. Your goal is to create pixel-perfect, adaptive interfaces that work across all device sizes using `AdaptiveDesignHub`.

## 1. Project Overview
**AdaptiveDesignHub** is a comprehensive Flutter library designed to streamline responsive UI development. It combines:
- **Screen Adaptation**: Precise scaling based on design mockups (e.g., Figma 375x812).
- **Theming System**: A centralized `AdaptiveTheme` for colors, typography, and spacing.
- **Fluent Extensions**: Concise syntax for styling and layout (e.g., `10.w`, `text.bold`).

## 2. Core Concepts
- **Design Size**: The reference resolution used by designers (default: 375x812).
- **Adapters**:
  - `ScreenUtilAdapter`: Uses `flutter_screenutil` (Recommended/Default).
  - `NativeAdapter`: A lightweight fallback using logic-based scaling.
- **Scaling Logic**:
  - `.w`: Scale based on screen width (Horizontal margins, widths).
  - `.h`: Scale based on screen height (Vertical margins, heights).
  - `.r`: Scale based on the smaller dimension (Radius, square icons).
  - `.sp`: Scale text size (respects system accessibility settings).

## 3. Initialization (Mandatory)
You **MUST** initialize the library in `main.dart` within a `ScreenUtilInit` builder to ensure proper context and layout calculation.

```dart
// main.dart
import 'package:adaptive_design_hub/adaptive_design_hub.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Match your Figma design
      minTextAdapt: true,
      builder: (context, child) {
        // Initialize the Hub singleton
        AdaptiveDesignHub().init(
          useScreenUtil: true,
          designSize: const Size(375, 812),
          theme: AdaptiveTheme(
            colors: AdaptiveColors(
              primary: Colors.indigo,
              secondary: Colors.amber,
              background: Colors.white,
            ),
          ),
        );

        return MaterialApp(
          home: const HomePage(),
        );
      },
    );
  }
}
```

## 4. API Reference & Extensions

### 4.1. Numeric Extensions (`num`)
Use these on any number (`int` or `double`) to scale values.

| Extension | Purpose | Use Case |
| :--- | :--- | :--- |
| `.w` | Width scaling | Widths, left/right padding/margin |
| `.h` | Height scaling | Heights, top/bottom padding/margin |
| `.r` | Radius scaling | Border radius, square widget dimensions |
| `.sp` | Text scaling | Font sizes (accessibility aware) |
| `.verticalSpace` | Spacing Widget | `SizedBox(height: .h)` |
| `.horizontalSpace` | Spacing Widget | `SizedBox(width: .w)` |

**Example**:
```dart
Container(
  width: 100.w,
  height: 50.h,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.r),
  ),
);
16.verticalSpace; // Adds a gap
```

### 4.2. Context Extensions (`BuildContext`)
Access theme and device info directly from `context`.

| Property | Description |
| :--- | :--- |
| `context.adaptiveTheme` | The global `AdaptiveTheme` object |
| `context.adaptiveColors` | Access color palette (`primary`, `surface`, etc.) |
| `context.adaptiveTypography` | Access typography styles (`headlineLarge`, `bodyMedium`, etc.) |
| `context.adaptiveSpacing` | Access spacing constants (`s`, `m`, `l`, etc.) |
| `context.screenSize` | `MediaQuery.of(context).size` |
| `context.screenWidth` | Width in logical pixels |
| `context.screenHeight` | Height in logical pixels |
| `context.isPortrait` | `true` if in portrait mode |
| `context.isLandscape` | `true` if in landscape mode |

### 4.3. Widget Extensions (`Widget`)
Wrap widgets with common layout patterns.

| Extension | Equivalent Code |
| :--- | :--- |
| `.center` | `Center(child: this)` |
| `.expand` | `Expanded(child: this)` |
| `.flexible` | `Flexible(child: this)` |
| `.scrollable` | `SingleChildScrollView(child: this)` |
| `.safeArea` | `SafeArea(child: this)` |
| `.p(16)` | `Padding(padding: EdgeInsets.all(16.w), ...)` |
| `.px(16)` | `Padding(padding: EdgeInsets.symmetric(horizontal: 16.w), ...)` |
| `.py(16)` | `Padding(padding: EdgeInsets.symmetric(vertical: 16.h), ...)` |
| `.w(100)` | `SizedBox(width: 100.w, ...)` |
| `.h(100)` | `SizedBox(height: 100.h, ...)` |

### 4.4. Text Extensions (`Text` Widget)
Fluent styling for `Text` widgets. These **automatically apply `.sp`** to font sizes.

```dart
Text('Hello')
  .fontSize(20)   // Sets size to 20.sp
  .bold           // FontWeight.bold
  .color(Colors.red)
  .center;        // Wraps in Center (from Widget extension)
```

| Extension | Description |
| :--- | :--- |
| `.fontSize(double)` | Sets font size (scaled with `.sp`) |
| `.bold` | `FontWeight.bold` |
| `.semiBold` | `FontWeight.w600` |
| `.medium` | `FontWeight.w500` |
| `.regular` | `FontWeight.w400` |
| `.light` | `FontWeight.w300` |
| `.color(Color)` | Sets text color |
| `.align(TextAlign)` | Sets text alignment |

## 5. Theming System

### 5.1. Creating a Theme
Configure your theme in `AdaptiveDesignHub().init`.

```dart
AdaptiveTheme(
  colors: AdaptiveColors(
    primary: Color(0xFF6200EE),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF000000),
  ),
  typography: AdaptiveTypography(
    fontFamily: 'Roboto', // Applied to all styles
    bodyMedium: TextStyle(fontSize: 14), // Will be scaled automatically
  ),
);
```

### 5.2. Using the Theme
Always access colors and styles via `context` to ensure consistency.

```dart
Widget build(BuildContext context) {
  final c = context.adaptiveColors;
  final t = context.adaptiveTypography;

  return Container(
    color: c.surface,
    child: Text(
      'Headline',
      style: t.headlineMedium.colorExt(c.primary),
    ),
  );
}
```

## 6. Best Practices

1.  **Always use scaling extensions**: Never write raw numbers for layout.
    *   ❌ `width: 100`
    *   ✅ `width: 100.w`
2.  **Use `.sp` for text**: This ensures the app respects the user's system font size settings.
3.  **Use Context Extensions**: Prefer `context.adaptiveColors` over hardcoded `Colors.blue`.
4.  **Compose Extensions**: Chain extensions for cleaner code.
    *   Example: `myWidget.px(16).py(8).center`
5.  **Design Size Consistency**: Ensure the `designSize` in `ScreenUtilInit` and `AdaptiveDesignHub.init` matches the design file (Figma/Sketch) exactly.

## 7. Common Pitfalls
*   **Forgetting Initialization**: Calling `.w` or accessing theme before `AdaptiveDesignHub().init` will throw an error.
*   **Mixed Scaling**: Avoid mixing `.w` and `.h` for square objects unless you want them to distort. Use `.r` or `.w` for both dimensions to keep aspect ratio.
*   **Context in Init**: `AdaptiveDesignHub().init` does *not* strict require context, but `ScreenUtil` does. Ensure `ScreenUtilInit` is at the root.

---
**End of Guide**
