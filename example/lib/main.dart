import 'package:adaptive_design_hub/adaptive_design_hub.dart';
import 'package:flutter/material.dart';

// 1. Define a Custom Theme Extension
class ShadowThemeExtension extends ThemeExtension<ShadowThemeExtension> {
  final BoxShadow cardShadow;

  const ShadowThemeExtension({required this.cardShadow});

  @override
  ThemeExtension<ShadowThemeExtension> copyWith({BoxShadow? cardShadow}) {
    return ShadowThemeExtension(cardShadow: cardShadow ?? this.cardShadow);
  }

  @override
  ThemeExtension<ShadowThemeExtension> lerp(
    ThemeExtension<ShadowThemeExtension>? other,
    double t,
  ) {
    if (other is! ShadowThemeExtension) return this;
    return ShadowThemeExtension(
      cardShadow: BoxShadow.lerp(cardShadow, other.cardShadow, t)!,
    );
  }
}

void main() {
  // 2. Initialize with configuration
  AdaptiveDesignHub().init(
    useScreenUtil: true,
    designSize: const Size(375, 812),
    theme: AdaptiveTheme(
      colors: AdaptiveColors(
        primary: Colors.indigo,
        secondary: Colors.amber,
        background: Colors.grey.shade50,
      ),
      spacing: const AdaptiveSpacing(m: 16.0, l: 24.0),
      // Register custom extension
      extensions: [
        ShadowThemeExtension(
          cardShadow: BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ),
      ],
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp(
            title: 'AdaptiveDesignHub Showcase',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.indigo,
              scaffoldBackgroundColor: Colors.grey.shade50,
              useMaterial3: true,
            ),
            home: const ShowcasePage(),
          ),
    );
  }
}

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing theme shortcuts
    final colors = context.adaptiveColors;
    // final typography = context.adaptiveTypography; // Used inline later if needed, or remove
    final spacing = context.adaptiveSpacing;
    final shadows = context.adaptiveTheme.extension<ShadowThemeExtension>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Design Hub').fontSize(20),
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
      ),
      backgroundColor: colors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Widget Extension: .p (Padding) & .scrollable (SingleChildScrollView)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionHeader(context, '1. Typography Scale'),
              _buildTypographyShowcase(context),

              _buildSectionHeader(context, '2. Spacing & Sizing (.w, .h, .r)'),
              _buildSizingShowcase(context),

              _buildSectionHeader(context, '3. Widget Extensions'),
              _buildWidgetExtensionsShowcase(context, shadows),

              _buildSectionHeader(context, '4. Context & Orientation'),
              _buildContextShowcase(context),
            ],
          ).p(spacing.m).scrollable.expand, // Padding + Scroll + Expanded
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      margin: EdgeInsets.only(bottom: 12.h, top: 24.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.adaptiveColors.primary.withOpacity(0.2),
          ),
        ),
      ),
      child: Text(
        title,
        style: context.adaptiveTypography.titleMedium.colorExt(
          context.adaptiveColors.primary,
        ),
      ),
    );
  }

  Widget _buildTypographyShowcase(BuildContext context) {
    final t = context.adaptiveTypography;
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Display Large',
            style: t.displayLarge.fontSizeExt(24),
          ), // Scaled down for demo
          Text('Headline Medium', style: t.headlineMedium),
          Text('Title Medium', style: t.titleMedium),
          Text('Body Medium', style: t.bodyMedium),
          Text('Label Small', style: t.labelSmall),

          12.verticalSpace,
          const Text('Custom styled via extensions')
              .fontSize(16)
              .fontWeight(FontWeight.bold)
              .color(Colors.purple)
              .align(TextAlign.center)
              .center,
        ],
      ).p(16),
    );
  }

  Widget _buildSizingShowcase(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // .w extension
        Container(
          width: 80.w,
          height: 80.w, // Square based on width
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: const Text('80.w').center,
        ),
        // .h extension
        Container(
          width: 80.h,
          height: 80.h, // Square based on height
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(40.r), // Circular
          ),
          child: const Text('80.h').center,
        ),
        // .sp extension
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text('14.sp', style: TextStyle(fontSize: 14.sp)).center,
        ),
      ],
    );
  }

  Widget _buildWidgetExtensionsShowcase(
    BuildContext context,
    ShadowThemeExtension? shadowExt,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: shadowExt != null ? [shadowExt.cardShadow] : null,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Expanded Item').center.p(10).card.expand,
              const Text('Flexible').center.p(10).card.flexible,
            ],
          ),
          12.verticalSpace,
          const Text('Tap me (Scale Action)')
              .p(12)
              .center
              .container(
                color: Colors.grey.shade200,
                radius: 8,
                boxShadow: shadowExt != null ? [shadowExt.cardShadow] : null,
              )
              .fit(fit: BoxFit.scaleDown),
        ],
      ).p(16),
    );
  }

  Widget _buildContextShowcase(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.indigo.shade100),
      ),
      child: Column(
        children: [
          _infoRow('Screen W', '${context.screenWidth.toStringAsFixed(1)} dp'),
          _infoRow('Screen H', '${context.screenHeight.toStringAsFixed(1)} dp'),
          _infoRow(
            'Orientation',
            context.isPortrait ? 'Portrait' : 'Landscape',
          ),
          _infoRow(
            'Device Type',
            context.screenWidth > 600 ? 'Tablet' : 'Phone',
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    ).pb(4); // Padding bottom 4.h
  }
}

// Helper extension for demo
extension DemoWidgetExt on Widget {
  Widget get card =>
      Card(margin: EdgeInsets.zero, color: Colors.blue.shade50, child: this);

  Widget container({
    Color? color,
    double radius = 0,
    List<BoxShadow>? boxShadow,
  }) => Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius.r),
      boxShadow: boxShadow,
    ),
    child: this,
  );
}
