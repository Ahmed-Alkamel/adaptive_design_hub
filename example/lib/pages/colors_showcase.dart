import 'package:adaptive_design_hub/adaptive_design_hub.dart';
import 'package:flutter/material.dart';

class ColorsShowcase extends StatelessWidget {
  const ColorsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.adaptiveColors;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors Showcase').fontSize(20),
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
      ),
      backgroundColor: colors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildColorRow(context, 'Primary', colors.primary),
            _buildColorRow(context, 'Secondary', colors.secondary),
            _buildColorRow(context, 'Background', colors.background),
            _buildColorRow(context, 'Surface', colors.surface),
            _buildColorRow(context, 'Error', colors.error),
            _buildColorRow(context, 'Text Primary', colors.textPrimary),
            _buildColorRow(context, 'Text Secondary', colors.textSecondary),

            24.verticalSpace,
            Text(
              'These colors are defined in AdaptiveTheme and accessible via context.adaptiveColors.',
              textAlign: TextAlign.center,
              style: context.adaptiveTypography.bodyMedium.colorExt(
                colors.textSecondary,
              ),
            ).px(16),
          ],
        ).p(16),
      ),
    );
  }

  Widget _buildColorRow(BuildContext context, String name, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: context.adaptiveTypography.titleMedium.bold),
              Text(
                '0x${color.value.toRadixString(16).toUpperCase()}',
                style: context.adaptiveTypography.bodySmall,
              ),
            ],
          ).expand,
        ],
      ),
    );
  }
}
