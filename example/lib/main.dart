import 'package:adaptive_design_hub/adaptive_design_hub.dart';
import 'package:example/pages/colors_showcase.dart';
import 'package:example/pages/extensions_showcase.dart';
import 'package:example/pages/master_design_showcase.dart';
import 'package:example/pages/sizing_spacing_showcase.dart';
import 'package:example/pages/typography_showcase.dart';
import 'package:flutter/material.dart';

void main() {
  AdaptiveDesignHub().init(
    useScreenUtil: true,
    designSize: const Size(375, 812),
    theme: AdaptiveTheme(
      colors: AdaptiveColors(primary: Colors.indigo, secondary: Colors.amber),
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
            title: 'Adaptive Design Hub Example',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
              useMaterial3: true,
            ),
            home: const HomePage(),
          ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adaptive Design Hub').fontSize(20)),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          _buildNavCard(
            context,
            'Typography Showcase',
            'Material 3 Scale & Text Extensions',
            Icons.text_fields,
            const TypographyShowcase(),
          ),
          _buildNavCard(
            context,
            'Colors Showcase',
            'Adaptive Palette & Theme Colors',
            Icons.palette,
            const ColorsShowcase(),
          ),
          _buildNavCard(
            context,
            'Sizing & Spacing',
            '.w, .h, .r, .sp and Spacing Constants',
            Icons.aspect_ratio,
            const SizingSpacingShowcase(),
          ),
          _buildNavCard(
            context,
            'Extensions Showcase',
            'Context & Widget Power-ups',
            Icons.extension,
            const ExtensionsShowcase(),
          ),

          24.verticalSpace,
          _buildNavCard(
            context,
            'Master Design Demo',
            'Full UI constructed with Adaptive Design Hub',
            Icons.diamond,
            const MasterDesignShowcase(),
            isPrimary: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNavCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Widget page, {
    bool isPrimary = false,
  }) {
    final c = context.adaptiveColors;

    return Card(
      elevation: isPrimary ? 4 : 1,
      shadowColor: isPrimary ? c.primary.withValues(alpha: 0.4) : null,
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side:
            isPrimary
                ? BorderSide(color: c.primary, width: 2)
                : BorderSide.none,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        leading: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: isPrimary ? c.primary : c.surface,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            color: isPrimary ? Colors.white : c.primary,
            size: 24.sp,
          ),
        ),
        title: Text(title).bold.fontSize(16),
        subtitle: Text(subtitle).fontSize(12).color(Colors.grey),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }
}
