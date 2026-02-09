import 'package:adaptive_design_hub/adaptive_design_hub.dart';
import 'package:flutter/material.dart';

class SizingSpacingShowcase extends StatelessWidget {
  const SizingSpacingShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sizing & Spacing').fontSize(20)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Adaptive Extensions (.w, .h, .r, .sp)',
            ).bold.fontSize(16).pb(12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBox('80.w', 80.w, 80.w, Colors.blue.shade100),
                _buildBox('80.h', 80.h, 80.h, Colors.orange.shade100),
                _buildBox('80.dp/sp', 80.dp, 80.dp, Colors.green.shade100),
              ],
            ),

            24.verticalSpace,
            const Text('Adaptive Spacing Constants').bold.fontSize(16).pb(12),
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: [
                _buildSpacingBadge(context, 'XS', context.adaptiveSpacing.xs),
                _buildSpacingBadge(context, 'S', context.adaptiveSpacing.s),
                _buildSpacingBadge(context, 'M', context.adaptiveSpacing.m),
                _buildSpacingBadge(context, 'L', context.adaptiveSpacing.l),
                _buildSpacingBadge(context, 'XL', context.adaptiveSpacing.xl),
                _buildSpacingBadge(context, 'XXL', context.adaptiveSpacing.xxl),
              ],
            ),

            24.verticalSpace,
            const Text('Adaptive Radius (.r)').bold.fontSize(16).pb(12),
            Row(
              children: [
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const Text('10.r').center,
                ),
                16.horizontalSpace,
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: const Text('30.r').center,
                ),
              ],
            ),
          ],
        ).p(16),
      ),
    );
  }

  Widget _buildBox(String label, double w, double h, Color color) {
    return Container(
      width: w,
      height: h,
      color: color,
      child: Center(child: Text(label, style: TextStyle(fontSize: 12.sp))),
    );
  }

  Widget _buildSpacingBadge(BuildContext context, String label, double value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: context.adaptiveColors.surface,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle().bold),
          Text(
            '${value.toStringAsFixed(1)} dp',
            style: const TextStyle(fontSize: 10).colorExt(Colors.grey),
          ),
        ],
      ),
    );
  }
}
