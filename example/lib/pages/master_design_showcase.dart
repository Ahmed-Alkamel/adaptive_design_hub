import 'package:adaptive_design_hub/adaptive_design_hub.dart';
import 'package:flutter/material.dart';

class MasterDesignShowcase extends StatelessWidget {
  const MasterDesignShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.adaptiveTypography;
    final c = context.adaptiveColors;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.h,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Adaptive Master Design').fontSize(18),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [c.primary, c.secondary],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.design_services_outlined,
                    size: 60.sp,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCategoryHeader(context, 'Featured Content'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      _buildFeaturedCard(context, 'Modern UI', Colors.purple),
                      16.horizontalSpace,
                      _buildFeaturedCard(context, 'Responsive', Colors.orange),
                      16.horizontalSpace,
                      _buildFeaturedCard(context, 'Adaptive', Colors.blue),
                    ],
                  ),
                ),

                24.verticalSpace,
                _buildCategoryHeader(context, 'Latest Updates'),

                _buildListItem(
                  context,
                  'Version 2.0 Released',
                  'Now with material 3 support',
                ),
                _buildListItem(
                  context,
                  'New Extensions',
                  'Padding, Sizing, and more shortcuts added',
                ),
                _buildListItem(
                  context,
                  'Performance Boost',
                  'Optimized adapter calculations',
                ),

                24.verticalSpace,
                _buildCategoryHeader(context, 'Interactive Elements'),

                Container(
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.r,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Ready to build?',
                        style: t.headlineSmall.colorExt(c.primary),
                      ),
                      8.verticalSpace,
                      Text(
                        'Start using AdaptiveDesignHub today for pixel-perfect apps on any device.',
                        textAlign: TextAlign.center,
                        style: t.bodyMedium.colorExt(c.textSecondary),
                      ),
                      24.verticalSpace,
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: c.primary,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.w,
                            vertical: 16.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: const Text(
                          'Get Started',
                        ).fontSize(16).fontWeight(FontWeight.bold),
                      ).w(double.infinity),
                    ],
                  ),
                ).px(16),

                40.verticalSpace,
              ],
            ).pt(16),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(BuildContext context, String title) {
    return Text(
      title,
    ).fontSize(18).bold.color(context.adaptiveColors.textPrimary).px(16).pb(12);
  }

  Widget _buildFeaturedCard(BuildContext context, String title, Color color) {
    return Container(
      width: 140.w,
      height: 180.h,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.2),
            radius: 30.r,
            child: Icon(Icons.star, color: color, size: 28.sp),
          ),
          16.verticalSpace,
          Text(title).bold.color(color).fontSize(16),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: context.adaptiveColors.secondary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(
          Icons.check_circle,
          color: context.adaptiveColors.secondary,
          size: 20.sp,
        ),
      ),
      title: Text(title).bold.fontSize(14),
      subtitle: Text(subtitle).fontSize(12).color(Colors.grey),
    );
  }
}
