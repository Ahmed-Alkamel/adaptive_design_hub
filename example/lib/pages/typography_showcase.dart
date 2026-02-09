import 'package:adaptive_design_hub/adaptive_design_hub.dart';
import 'package:flutter/material.dart';

class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.adaptiveTypography;

    return Scaffold(
      appBar: AppBar(title: const Text('Typography Showcase').fontSize(20)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection(context, 'Material 3 Scale', [
              Text('Display Large', style: t.displayLarge),
              Text('Display Medium', style: t.displayMedium),
              Text('Display Small', style: t.displaySmall),
              12.verticalSpace,
              Text('Headline Large', style: t.headlineLarge),
              Text('Headline Medium', style: t.headlineMedium),
              Text('Headline Small', style: t.headlineSmall),
              12.verticalSpace,
              Text('Title Large', style: t.titleLarge),
              Text('Title Medium', style: t.titleMedium),
              Text('Title Small', style: t.titleSmall),
              12.verticalSpace,
              Text('Body Large', style: t.bodyLarge),
              Text('Body Medium', style: t.bodyMedium),
              Text('Body Small', style: t.bodySmall),
              12.verticalSpace,
              Text('Label Large', style: t.labelLarge),
              Text('Label Medium', style: t.labelMedium),
              Text('Label Small', style: t.labelSmall),
            ]),

            _buildSection(context, 'TextStyle Extensions', [
              const Text('Original Text'),
              Text(
                'Bold & Colored',
                style: const TextStyle(
                  fontSize: 16,
                ).bold.colorExt(Colors.purple),
              ),
              Text(
                'Letter Spacing (Adaptive)',
                style: const TextStyle(fontSize: 16).ls,
              ),
              Text(
                'Line Height (Adaptive)',
                style: const TextStyle(fontSize: 16).h,
              ),
              Text(
                'Explicit .sp (24.sp)',
                style: const TextStyle().fontSizeExt(24),
              ),
            ]),

            _buildSection(context, 'Text Widget Extensions', [
              const Text('I am using .fontSize(18)').fontSize(18),
              const Text('I am .fontWeight(Bold)').fontWeight(FontWeight.bold),
              const Text('I am .color(Red)').color(Colors.red),
              const Text('I am .align(Center)').align(TextAlign.center),
            ]),
          ],
        ).p(16),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Text(
            title,
            style: context.adaptiveTypography.titleMedium.bold.colorExt(
              context.adaptiveColors.primary,
            ),
          ),
        ),
        16.verticalSpace,
        ...children,
        32.verticalSpace,
      ],
    );
  }
}
