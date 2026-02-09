import 'package:adaptive_design_hub/adaptive_design_hub.dart';
import 'package:flutter/material.dart';

class ExtensionsShowcase extends StatelessWidget {
  const ExtensionsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Extensions Showcase').fontSize(20)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Widget Extension: .p (Padding) & .scrollable (SingleChildScrollView)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader('Widget Extensions'),

              Row(
                children: [
                  const Text('.expand').center.p(10).card.expand,
                  const Text('.flexible').center.p(10).card.flexible,
                ],
              ),
              12.verticalSpace,
              const Text('.center + .p(12) + .safeArea').p(12).center.safeArea,

              12.verticalSpace,
              _buildHeader('Context Extensions'),
              _buildInfoRow(
                context,
                'context.screenWidth',
                context.screenWidth.toStringAsFixed(1),
              ),
              _buildInfoRow(
                context,
                'context.isPortrait',
                '${context.isPortrait}',
              ),
              _buildInfoRow(
                context,
                'context.w(100)',
                context.w(100).toStringAsFixed(1),
              ),

              12.verticalSpace,
              _buildHeader('EdgeInsets Extensions'),
              Container(
                    color: Colors.blue.shade50,
                    child:
                        const Text('Padding via EdgeInsets.all(20).r').center,
                  )
                  .p(0)
                  .padding(
                    EdgeInsets.all(20).r,
                  ), // Using padding widget with adapt insets
            ],
          ).p(16).scrollable.expand,
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(title).bold.fontSize(16).color(Colors.indigo),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label).semiBold, Text(value).color(Colors.grey.shade700)],
    ).py(4);
  }
}

// Helper for demo visuals
extension on Widget {
  Widget get card => Card(color: Colors.amber.shade100, child: this);
  Widget padding(EdgeInsetsGeometry insets) =>
      Padding(padding: insets, child: this);
}
