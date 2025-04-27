import 'package:experiences_timeline/src/curved_line_painter.dart';
import 'package:experiences_timeline/src/extensions.dart';
import 'package:flutter/material.dart';
 
class StyledCard extends StatelessWidget {
  const StyledCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.borderEffect = false,
    required this.child,
  });

  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget child;
  final bool borderEffect;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (borderEffect) ...[
          const _BorderShadow(),
          Positioned(bottom: 0, right: 0, child: const _BorderShadow()),
        ],
        Container(
          width: width,
          height: height,
          padding: padding ?? EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: context.colorScheme.outline),
            color: context.colorScheme.surface,
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(24)),
          ),
          child: child,
        ),
        if (borderEffect)
          CustomPaint(
            size: Size(width ?? 0, height ?? 0),
            painter: CurvedLinePainter(color: context.colorScheme.primary),
          ),
      ],
    );
  }
}

class _BorderShadow extends StatelessWidget {
  const _BorderShadow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
    );
  }
}
