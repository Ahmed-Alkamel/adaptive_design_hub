# AdaptiveDesignHub

**AdaptiveDesignHub** is a comprehensive Flutter library designed to streamline responsive UI development. It provides a robust set of tools, extensions, and a theming system to ensure your application looks perfect on any screen size.

This library simplifies the complexity of supporting multiple devices by offering a unified API for scaling dimensions, fonts, and spacing, along with powerful extensions to reduce boilerplate code.

---

## Features

*   **Responsive Sizing:** Easily scale UI elements based on screen size using `.w`, `.h`, `.r`, and `.sp`.
*   **Adaptive Theming:** centralized management for colors, typography, and spacing that automatically adapts to the screen.
*   **Powerful Extensions:**
    *   **Num:** Short syntax for sizing (e.g., `10.w`).
    *   **Context:** Access theme and media query data directly (e.g., `context.theme`, `context.screenWidth`).
    *   **Widget:** Layout application shortcuts (e.g., `.center`, `.p(10)`, `.expand`).
    *   **Text:** Fluent styling API (e.g., `text.bold.color(Colors.red).sp`).
*   **Flexible Adapters:** Supports both `flutter_screenutil` (default) and a native calculation mode.

---

## Codebase Walkthrough

This section provides a detailed explanation of the library's structure, file by file.

### 1. Root Directory

#### `lib/adaptive_design_hub.dart`
**Purpose:** The main entry point for the library.
**Description:** This file exports all the necessary modules, making them available to your application with a single import.
*   **Exports:**
    *   Core logic (`AdaptiveDesignHub`).
    *   Theming system (`AdaptiveTheme`).
    *   All extensions (`num`, `context`, `widget`, `text`, `edge_insets`).
    *   `flutter_screenutil` essentials (`ScreenUtilInit`, `ScreenUtil`).

---

### 2. Core Logic (`lib/src/core`)

#### `lib/src/core/adaptive_design_hub.dart`
**Purpose:** The central singleton class needed to initialize and manage the library state.
**Description:**
*   **`AdaptiveDesignHub` (Singleton):** Holds the global state for the active `ResponsiveAdapter` and `AdaptiveTheme`.
*   **`init()` method:** Must be called to configure the library.
    *   **`useScreenUtil`:** Toggles between using `flutter_screenutil` or the native adapter.
    *   **`designSize`:** Sets the baseline design dimensions (default: 375x812).
    *   **`theme`:** Accepts a custom `AdaptiveTheme` configuration.
*   **Functionality:** It initializes the appropriate adapter and prepares the theme by scaling typography based on the device's screen size.

---

### 3. Adapters (`lib/src/adapters`)

This directory contains the logic for calculating responsive values.

#### `lib/src/adapters/responsive_adapter.dart`
**Purpose:** The abstract interface for responsive implementation.
**Description:** Defines the contract that any adapter must follow.
*   **Methods:** `setWidth`, `setHeight`, `setRadius`, `setSp`.
*   **Usage:** Ensures consistent API usage regardless of the underlying calculation engine.

#### `lib/src/adapters/screen_util_adapter.dart`
**Purpose:** The default adapter implementation using the popular `flutter_screenutil` package.
**Description:**
*   **Logic:** Delegates all calls (`.w`, `.h`, etc.) to the `ScreenUtil` library.
*   **Benefit:** Leverages a battle-tested solution for precise screen adaptation.

#### `lib/src/adapters/native_adapter.dart`
**Purpose:** A lightweight, dependency-free adapter implementation.
**Description:**
*   **Logic:** Uses Flutter's `PlatformDispatcher` to get physical screen size and calculates scaling factors based on the provided `designSize`.
*   **Usage:** Used when `useScreenUtil` is set to `false`.

---

### 4. Theme System (`lib/src/theme`)

#### `lib/src/theme/adaptive_theme.dart`
**Purpose:** Defines the structure for the application's design system.
**Description:**
*   **`AdaptiveTheme`:** Deeply integrated container for:
    *   **`colors` (`AdaptiveColors`):** Semantic color definitions (primary, secondary, background, error, etc.).
    *   **`typography` (`AdaptiveTypography`):** Material 3 text styles (display, headline, title, body, label). Includes an `adapted` getter that automatically applies `.sp` scaling to all font sizes.
    *   **`spacing` (`AdaptiveSpacing`):** Standardized spacing constants (xs, s, m, l, xl, xxl).
    *   **`extensions`:** Support for custom `ThemeExtension`s.

---

### 5. Extensions (`lib/src/extensions`)

These files provide the developer-friendly syntax that makes this library a joy to use.

#### `lib/src/extensions/num_extensions.dart`
**Purpose:** Extensions on `num` (int and double) for sizing.
**Description:**
*   **Getters:** `.w` (width), `.h` (height), `.r` (radius), `.sp` (font size). These delegate directly to the active `ResponsiveAdapter`.
*   **Helpers:**
    *   `.verticalSpace`: Returns a `SizedBox(height: scaled_value)`.
    *   `.horizontalSpace`: Returns a `SizedBox(width: scaled_value)`.

#### `lib/src/extensions/context_extensions.dart`
**Purpose:** Extensions on `BuildContext` for easy access to theme and media data.
**Description:**
*   **Theme Shortcuts:** `context.theme`, `context.textTheme`, `context.colorScheme`.
*   **Adaptive Shortcuts:** `context.adaptiveTheme`, `context.adaptiveColors`, `context.adaptiveSpacing`.
*   **Media Query Shortcuts:** `context.screenSize`, `context.screenWidth`, `context.screenHeight`, `context.padding` (safe area), `context.orientation`, `context.isPortrait`, `context.isLandscape`.
*   **Direct Scaling:** `context.w(10)`, `context.h(10)`. Useful for explicit scaling needs.

#### `lib/src/extensions/widget_extensions.dart`
**Purpose:** Extensions on `Widget` for layout and styling shortcuts.
**Description:**
*   **Padding:** chainable padding methods like `.p(10)` (all), `.px(10)` (horizontal), `.py(10)` (vertical), `.pt/pb/pl/pr` (specific sides). All values are automatically responsive.
*   **Layout:** `.center`, `.expand`, `.flexible`, `.safeArea`, `.scrollable`.
*   **Sizing:** `.w(value)`, `.h(value)`, `.size(value)`. Wraps the widget in a `SizedBox` with responsive dimensions.

#### `lib/src/extensions/text_extensions.dart`
**Purpose:** Extensions on `TextStyle` and the `Text` widget itself.
**Description:**
*   **`TextStyle` Extensions:**
    *   `.sp`: Scales the font size.
    *   Shortcuts: `.bold`, `.semiBold`, `.medium`, `.regular`, `.light`, `.colorExt(color)`.
*   **`Text` Extensions:** Allows fluent styling directly on a `Text` widget.
    *   Example: `Text("Hello").fontSize(20).bold.color(Colors.blue).center`

#### `lib/src/extensions/edge_insets_extensions.dart`
**Purpose:** Extensions on `EdgeInsets` and `EdgeInsetsGeometry`.
**Description:**
*   **`.r`:** The most common extension. It intelligently scales vertical properties (top/bottom) using height scaling and horizontal properties (left/right) using width scaling.
*   **`.w` / `.h`:** Forces all sides to scale based on width or height, respectively.
