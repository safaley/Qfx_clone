import 'package:flutter/material.dart';

import '../icons/logo_painter.dart';

CustomPaint qfxLogo(double width) {
  return CustomPaint(
    size: Size(
      width,
      (width * 0.48716379413048094).toDouble(),
    ),
    painter: QFXLogoPainter(),
  );
}
