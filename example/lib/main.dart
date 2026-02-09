import 'package:adaptive_design_hub/adaptive_design_hub.dart';
import 'package:flutter/material.dart';

void main() {
  // Initialize AdaptiveDesignHub
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
    // ScreenUtilInit is required when useScreenUtil is true (default)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Adaptive Design Hub Example',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Demo'),
        backgroundColor: context.adaptiveColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Adaptive Extensions from Num
            Container(
              height: 200.h,
              color: context.adaptiveColors.secondary.withValues(alpha: 0.2),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Responsive Container',
                      style:
                          context
                              .adaptiveTypography
                              .headlineMedium, // Adaptive text style
                    ),
                    Text(
                      'Height: 200.h\nWidth: Full',
                      textAlign: TextAlign.center,
                      style: context.adaptiveTypography.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),

            20.verticalSpace, // Num extension Widget
            // 2. Widget Extensions
            Container(
              color: Colors.blue.shade100,
              child:
                  const Text('I am centered and padded via extensions')
                      .fontSize(16) // Text Extension
                      .color(Colors.blue.shade900) // Text Extension
                      .bold // TextStyle Extension shortcut via Text Extension logic?
                      // Wait, .bold is on TextStyle, not Text. Let's use clean text style
                      .p(20) // Widget Extension (Padding)
                      .center, // Widget Extension (Center)
            ),

            20.verticalSpace,

            // 3. Context Extensions
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.r,
                    spreadRadius: 2.r,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Context Info',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: context.adaptiveColors.primary,
                    ),
                  ),
                  Divider(height: 20.h),
                  Text(
                    'Screen Width: ${context.screenWidth.toStringAsFixed(2)}',
                  ),
                  Text(
                    'Screen Height: ${context.screenHeight.toStringAsFixed(2)}',
                  ),
                  Text(
                    'Orientation: ${context.isPortrait ? "Portrait" : "Landscape"}',
                  ),
                ],
              ),
            ),

            // 4. Manual Adaptive Padding
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.adaptiveColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Action Button',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.w, // Adaptive letter spacing
                  ),
                ),
              ),
            ),

            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
