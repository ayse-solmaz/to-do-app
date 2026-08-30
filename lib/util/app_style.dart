import 'package:flutter/material.dart';

/// Paletin tek rengi.
const Color kNavy = Color(0xFF000080);

/// Navy'nin koyu tonu; golge ve kaydirma aksiyonu icin kullaniliyor.
const Color kNavyDark = Color(0xFF00004D);

/// Notr tonlar navy'nin saydamlik varyantlarindan uretiliyor;
/// boylece palette beyaz ve navy disinda renk olusmuyor.
Color navyAlpha(double alpha) => kNavy.withValues(alpha: alpha);

/// Navy kutunun uzerine binen beyaz tonlari.
Color whiteAlpha(double alpha) => Colors.white.withValues(alpha: alpha);

/// Beyaz zemin uzerinde duran navy kutu.
class AppCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final bool muted;

  const AppCard({
    super.key,
    required this.child,
    this.radius = 18,
    this.padding,
    this.muted = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: muted ? navyAlpha(0.55) : kNavy,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: navyAlpha(muted ? 0.10 : 0.22),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: padding == null
          ? child
          : Padding(padding: padding!, child: child),
    );
  }
}
