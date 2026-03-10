import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';

class SoftCard extends StatelessWidget {
  const SoftCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(20),
    this.margin,
    this.borderRadius = 24,
    this.color,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surfaceTheme = theme.extension<AppSurfaceTheme>() ?? AppSurfaceTheme.light();

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? surfaceTheme.cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: surfaceTheme.borderColor,
          width: 0.45,
        ),
        boxShadow: surfaceTheme.softShadow,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
