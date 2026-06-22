import 'package:flutter/material.dart';
import '../models/product.dart';

// ─── Club Crest Painter ──────────────────────────────────────────────────────

class CrestPainter extends CustomPainter {
  final String team;
  const CrestPainter(this.team);

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.46;
    switch (team) {
      case 'Manchester United': _drawManUtd(canvas, cx, cy, r, size); break;
      case 'Real Madrid':       _drawRealMadrid(canvas, cx, cy, r, size); break;
      case 'FC Barcelona':      _drawBarcelona(canvas, cx, cy, r, size); break;
      case 'Liverpool FC':      _drawLiverpool(canvas, cx, cy, r, size); break;
      case 'Bayern Munich':     _drawBayern(canvas, cx, cy, r, size); break;
      case 'Paris Saint-Germain': _drawPSG(canvas, cx, cy, r, size); break;
      default: _drawGeneric(canvas, cx, cy, r);
    }
  }

  // ── Helper: draw shield path ───────────────────────────────────────────────
  Path _shieldPath(double cx, double cy, double r) {
    return Path()
      ..moveTo(cx - r * 0.75, cy - r)
      ..lineTo(cx + r * 0.75, cy - r)
      ..lineTo(cx + r * 0.95, cy - r * 0.5)
      ..lineTo(cx + r * 0.95, cy + r * 0.3)
      ..quadraticBezierTo(cx + r * 0.6, cy + r * 0.9, cx, cy + r)
      ..quadraticBezierTo(cx - r * 0.6, cy + r * 0.9, cx - r * 0.95, cy + r * 0.3)
      ..lineTo(cx - r * 0.95, cy - r * 0.5)
      ..close();
  }

  // ── Helper: draw text ──────────────────────────────────────────────────────
  void _text(Canvas canvas, String t, Offset o, double fs, Color c,
      {FontWeight fw = FontWeight.bold}) {
    final tp = TextPainter(
      text: TextSpan(
          text: t,
          style: TextStyle(
              color: c, fontSize: fs, fontWeight: fw, letterSpacing: 0.5,
              shadows: [Shadow(color: Colors.black38, offset: const Offset(0.5, 0.5), blurRadius: 1)])),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, o - Offset(tp.width / 2, tp.height / 2));
  }

  // ─────────────────────────────────────────────────────────────────────────
  void _drawManUtd(Canvas canvas, double cx, double cy, double r, Size size) {
    final shield = _shieldPath(cx, cy, r);

    // Outer gold border
    canvas.drawPath(shield, Paint()..color = const Color(0xFFFFD700));
    // Shrink for red fill
    final inner = _shieldPath(cx, cy, r * 0.93);
    canvas.drawPath(inner, Paint()..color = const Color(0xFFCC0000));

    // White horizontal band (centre)
    canvas.save();
    canvas.clipPath(inner);
    canvas.drawRect(
        Rect.fromLTWH(cx - r, cy - r * 0.12, r * 2, r * 0.24),
        Paint()..color = Colors.white);

    // Devil silhouette (simplified: body + horns)
    final devilPaint = Paint()..color = const Color(0xFFCC0000);
    // head
    canvas.drawOval(
        Rect.fromCenter(center: Offset(cx, cy - r * 0.52), width: r * 0.38, height: r * 0.34),
        Paint()..color = Colors.white);
    // left horn
    final lHorn = Path()
      ..moveTo(cx - r * 0.22, cy - r * 0.62)
      ..lineTo(cx - r * 0.36, cy - r * 0.88)
      ..lineTo(cx - r * 0.14, cy - r * 0.68)
      ..close();
    canvas.drawPath(lHorn, Paint()..color = Colors.white);
    // right horn
    final rHorn = Path()
      ..moveTo(cx + r * 0.22, cy - r * 0.62)
      ..lineTo(cx + r * 0.36, cy - r * 0.88)
      ..lineTo(cx + r * 0.14, cy - r * 0.68)
      ..close();
    canvas.drawPath(rHorn, Paint()..color = Colors.white);
    // body/wings
    final wings = Path()
      ..moveTo(cx - r * 0.55, cy - r * 0.05)
      ..quadraticBezierTo(cx - r * 0.3, cy - r * 0.32, cx, cy - r * 0.22)
      ..quadraticBezierTo(cx + r * 0.3, cy - r * 0.32, cx + r * 0.55, cy - r * 0.05)
      ..quadraticBezierTo(cx + r * 0.3, cy + r * 0.08, cx, cy + r * 0.1)
      ..quadraticBezierTo(cx - r * 0.3, cy + r * 0.08, cx - r * 0.55, cy - r * 0.05)
      ..close();
    canvas.drawPath(wings, Paint()..color = Colors.white);
    // tail
    final tail = Path()
      ..moveTo(cx + r * 0.1, cy + r * 0.1)
      ..quadraticBezierTo(cx + r * 0.5, cy + r * 0.45, cx + r * 0.55, cy + r * 0.7)
      ..quadraticBezierTo(cx + r * 0.3, cy + r * 0.55, cx, cy + r * 0.38)
      ..close();
    canvas.drawPath(tail, Paint()..color = Colors.white);

    canvas.restore();
    // Border stroke
    canvas.drawPath(inner,
        Paint()..color = const Color(0xFFFFD700)..style = PaintingStyle.stroke..strokeWidth = r * 0.04);
    // 'MUFC' text bottom
    _text(canvas, 'MUFC', Offset(cx, cy + r * 0.68), r * 0.16, const Color(0xFFFFD700));
  }

  // ─────────────────────────────────────────────────────────────────────────
  void _drawRealMadrid(Canvas canvas, double cx, double cy, double r, Size size) {
    // Outer gold circle
    canvas.drawCircle(Offset(cx, cy), r, Paint()..color = const Color(0xFFFFD700));
    // Navy ring
    canvas.drawCircle(Offset(cx, cy), r * 0.9,
        Paint()..color = const Color(0xFF00529F)..style = PaintingStyle.stroke..strokeWidth = r * 0.18);
    // White fill
    canvas.drawCircle(Offset(cx, cy), r * 0.8, Paint()..color = Colors.white);

    // Crown on top
    final crownBg = Paint()..color = const Color(0xFF00529F);
    final crownPath = Path()
      ..moveTo(cx - r * 0.42, cy - r * 0.68)
      ..lineTo(cx - r * 0.42, cy - r * 0.52)
      ..lineTo(cx + r * 0.42, cy - r * 0.52)
      ..lineTo(cx + r * 0.42, cy - r * 0.68)
      // three points
      ..lineTo(cx + r * 0.3, cy - r * 0.88)
      ..lineTo(cx + r * 0.18, cy - r * 0.72)
      ..lineTo(cx, cy - r * 0.96)
      ..lineTo(cx - r * 0.18, cy - r * 0.72)
      ..lineTo(cx - r * 0.3, cy - r * 0.88)
      ..close();
    canvas.drawPath(crownPath, Paint()..color = const Color(0xFFFFD700));
    // Crown cross on top middle point
    canvas.drawRect(
        Rect.fromCenter(center: Offset(cx, cy - r * 0.97), width: r * 0.1, height: r * 0.18),
        Paint()..color = const Color(0xFFCC0000));
    canvas.drawRect(
        Rect.fromCenter(center: Offset(cx, cy - r * 0.97), width: r * 0.18, height: r * 0.07),
        Paint()..color = const Color(0xFFCC0000));

    // 'RM' monogram
    _text(canvas, 'R', Offset(cx - r * 0.2, cy - r * 0.18), r * 0.38,
        const Color(0xFF00529F));
    _text(canvas, 'M', Offset(cx + r * 0.18, cy - r * 0.18), r * 0.38,
        const Color(0xFF00529F));

    // Bottom text
    canvas.drawRect(
        Rect.fromLTWH(cx - r * 0.55, cy + r * 0.38, r * 1.1, r * 0.28),
        Paint()..color = const Color(0xFF00529F));
    _text(canvas, 'REAL MADRID', Offset(cx, cy + r * 0.53), r * 0.13, Colors.white);
  }

  // ─────────────────────────────────────────────────────────────────────────
  void _drawBarcelona(Canvas canvas, double cx, double cy, double r, Size size) {
    final shield = _shieldPath(cx, cy, r);
    // Gold outer
    canvas.drawPath(shield, Paint()..color = const Color(0xFFFFD700));
    final inner = _shieldPath(cx, cy, r * 0.92);

    canvas.save();
    canvas.clipPath(inner);

    // Top section: gold bar with cross
    canvas.drawRect(Rect.fromLTWH(cx - r, cy - r, r * 2, r * 0.35),
        Paint()..color = const Color(0xFFFFD700));
    // St George cross (red)
    canvas.drawRect(Rect.fromLTWH(cx - r * 0.08, cy - r, r * 0.16, r * 0.35),
        Paint()..color = const Color(0xFFCC0000));
    canvas.drawRect(Rect.fromLTWH(cx - r, cy - r * 0.78, r * 2, r * 0.13),
        Paint()..color = const Color(0xFFCC0000));

    // Left half: Catalan stripes (yellow/red)
    final stripeColors = [
        const Color(0xFFFFD700), const Color(0xFFCC0000), const Color(0xFFFFD700),
        const Color(0xFFCC0000), const Color(0xFFFFD700)];
    final sw = r * 0.19;
    for (int i = 0; i < 5; i++) {
      canvas.drawRect(
          Rect.fromLTWH(cx - r + i * sw, cy - r * 0.65, sw, r * 1.65),
          Paint()..color = stripeColors[i]);
    }

    // Right half: blue/red blaugrana vertical stripes
    final blueStripePaint = Paint()..color = const Color(0xFF003DA5);
    final redStripePaint  = Paint()..color = const Color(0xFFA50044);
    final sw2 = r * 0.18;
    for (int i = 0; i < 6; i++) {
      canvas.drawRect(
          Rect.fromLTWH(cx + i * sw2, cy - r * 0.65, sw2, r * 1.65),
          i.isEven ? blueStripePaint : redStripePaint);
    }

    // Centre ball / crest circle
    canvas.drawCircle(Offset(cx, cy + r * 0.18), r * 0.22,
        Paint()..color = Colors.white);
    _text(canvas, 'FCB', Offset(cx, cy + r * 0.18), r * 0.18, const Color(0xFF003DA5));

    canvas.restore();
    // Gold border
    canvas.drawPath(inner,
        Paint()..color = const Color(0xFFFFD700)..style = PaintingStyle.stroke..strokeWidth = r * 0.05);
  }

  // ─────────────────────────────────────────────────────────────────────────
  void _drawLiverpool(Canvas canvas, double cx, double cy, double r, Size size) {
    final shield = _shieldPath(cx, cy, r);
    canvas.drawPath(shield, Paint()..color = const Color(0xFFFFD700));
    final inner = _shieldPath(cx, cy, r * 0.92);
    canvas.drawPath(inner, Paint()..color = const Color(0xFFC8102E));

    canvas.save();
    canvas.clipPath(inner);

    // Eternal flame bar top
    canvas.drawRect(Rect.fromLTWH(cx - r, cy - r * 1.05, r * 2, r * 0.25),
        Paint()..color = const Color(0xFFFFD700));
    // Flame shapes
    for (int i = -1; i <= 1; i++) {
      final flamePath = Path()
        ..moveTo(cx + i * r * 0.3 - r * 0.07, cy - r * 0.8)
        ..quadraticBezierTo(cx + i * r * 0.3, cy - r * 1.05, cx + i * r * 0.3 + r * 0.07, cy - r * 0.8)
        ..close();
      canvas.drawPath(flamePath, Paint()..color = const Color(0xFFFF6600));
    }

    // Liver bird (white stylised)
    final birdBody = Path()
      ..moveTo(cx - r * 0.12, cy - r * 0.55)
      ..quadraticBezierTo(cx - r * 0.28, cy - r * 0.3, cx - r * 0.2, cy - r * 0.05)
      ..quadraticBezierTo(cx - r * 0.05, cy + r * 0.05, cx + r * 0.1, cy - r * 0.05)
      ..quadraticBezierTo(cx + r * 0.22, cy - r * 0.2, cx + r * 0.38, cy - r * 0.32)
      ..quadraticBezierTo(cx + r * 0.45, cy - r * 0.5, cx + r * 0.28, cy - r * 0.6)
      ..quadraticBezierTo(cx + r * 0.1, cy - r * 0.56, cx, cy - r * 0.62)
      ..quadraticBezierTo(cx - r * 0.05, cy - r * 0.7, cx - r * 0.12, cy - r * 0.55)
      ..close();
    canvas.drawPath(birdBody, Paint()..color = Colors.white);
    // Beak
    final beak = Path()
      ..moveTo(cx + r * 0.28, cy - r * 0.6)
      ..lineTo(cx + r * 0.5, cy - r * 0.72)
      ..lineTo(cx + r * 0.28, cy - r * 0.52)
      ..close();
    canvas.drawPath(beak, Paint()..color = const Color(0xFFFFD700));

    // YNWA text
    canvas.drawRect(Rect.fromLTWH(cx - r * 0.75, cy + r * 0.12, r * 1.5, r * 0.24),
        Paint()..color = const Color(0xFFFFD700));
    _text(canvas, "YOU'LL NEVER", Offset(cx, cy + r * 0.2), r * 0.13, const Color(0xFFC8102E));
    _text(canvas, 'WALK ALONE', Offset(cx, cy + r * 0.43), r * 0.135, const Color(0xFFC8102E));

    canvas.restore();
    canvas.drawPath(inner,
        Paint()..color = const Color(0xFFFFD700)..style = PaintingStyle.stroke..strokeWidth = r * 0.05);
  }

  // ─────────────────────────────────────────────────────────────────────────
  void _drawBayern(Canvas canvas, double cx, double cy, double r, Size size) {
    // Outer navy circle
    canvas.drawCircle(Offset(cx, cy), r, Paint()..color = const Color(0xFF003366));
    // White ring
    canvas.drawCircle(Offset(cx, cy), r * 0.88,
        Paint()..color = Colors.white..style = PaintingStyle.stroke..strokeWidth = r * 0.1);
    // Red ring
    canvas.drawCircle(Offset(cx, cy), r * 0.76,
        Paint()..color = const Color(0xFFDC052D)..style = PaintingStyle.stroke..strokeWidth = r * 0.1);

    // Inner circle clip for chequered flag
    canvas.save();
    canvas.clipPath(Path()..addOval(
        Rect.fromCircle(center: Offset(cx, cy), radius: r * 0.62)));
    final navy  = Paint()..color = const Color(0xFF003366);
    final white = Paint()..color = Colors.white;
    final half  = r * 0.62;
    canvas.drawRect(Rect.fromLTWH(cx - half, cy - half, half, half), navy);
    canvas.drawRect(Rect.fromLTWH(cx,        cy - half, half, half), white);
    canvas.drawRect(Rect.fromLTWH(cx - half, cy,        half, half), white);
    canvas.drawRect(Rect.fromLTWH(cx,        cy,        half, half), navy);
    canvas.restore();

    // 'FCB' arc top label
    canvas.drawRect(Rect.fromLTWH(cx - r * 0.38, cy - r * 1.0, r * 0.76, r * 0.3),
        Paint()..color = const Color(0xFF003366));
    _text(canvas, 'FCB', Offset(cx, cy - r * 0.86), r * 0.2, Colors.white);

    // Bottom: MÜNCHEN
    canvas.drawRect(Rect.fromLTWH(cx - r * 0.54, cy + r * 0.72, r * 1.08, r * 0.3),
        Paint()..color = const Color(0xFF003366));
    _text(canvas, 'MÜNCHEN', Offset(cx, cy + r * 0.88), r * 0.15, Colors.white);
  }

  // ─────────────────────────────────────────────────────────────────────────
  void _drawPSG(Canvas canvas, double cx, double cy, double r, Size size) {
    final shield = _shieldPath(cx, cy, r);
    canvas.drawPath(shield, Paint()..color = const Color(0xFFFFD700));
    final inner = _shieldPath(cx, cy, r * 0.92);
    canvas.drawPath(inner, Paint()..color = const Color(0xFF003399));

    canvas.save();
    canvas.clipPath(inner);

    // White centre circle
    canvas.drawCircle(Offset(cx, cy - r * 0.05), r * 0.58,
        Paint()..color = Colors.white);
    // Red horizontal stripe
    canvas.drawRect(Rect.fromLTWH(cx - r, cy - r * 0.18, r * 2, r * 0.26),
        Paint()..color = const Color(0xFFCC0000));
    // White band lines on stripe
    for (double dy in [-0.14, 0.14]) {
      canvas.drawLine(Offset(cx - r, cy + r * dy), Offset(cx + r, cy + r * dy),
          Paint()..color = Colors.white..strokeWidth = r * 0.04);
    }

    // Eiffel Tower (gold)
    final tower = Paint()..color = const Color(0xFFFFD700);
    // Base legs
    final leftLeg = Path()
      ..moveTo(cx - r * 0.06, cy - r * 0.62)
      ..lineTo(cx - r * 0.25, cy - r * 0.14)
      ..lineTo(cx - r * 0.18, cy - r * 0.14)
      ..lineTo(cx - r * 0.04, cy - r * 0.58)
      ..close();
    canvas.drawPath(leftLeg, tower);
    final rightLeg = Path()
      ..moveTo(cx + r * 0.06, cy - r * 0.62)
      ..lineTo(cx + r * 0.25, cy - r * 0.14)
      ..lineTo(cx + r * 0.18, cy - r * 0.14)
      ..lineTo(cx + r * 0.04, cy - r * 0.58)
      ..close();
    canvas.drawPath(rightLeg, tower);
    // Crossbar
    canvas.drawRect(Rect.fromLTWH(cx - r * 0.23, cy - r * 0.34, r * 0.46, r * 0.07), tower);
    canvas.drawRect(Rect.fromLTWH(cx - r * 0.13, cy - r * 0.52, r * 0.26, r * 0.06), tower);
    // Spire
    final spire = Path()
      ..moveTo(cx, cy - r * 0.9)
      ..lineTo(cx - r * 0.04, cy - r * 0.64)
      ..lineTo(cx + r * 0.04, cy - r * 0.64)
      ..close();
    canvas.drawPath(spire, tower);

    // 'PSG' bottom
    canvas.drawRect(Rect.fromLTWH(cx - r * 0.75, cy + r * 0.38, r * 1.5, r * 0.28),
        Paint()..color = const Color(0xFF003399));
    _text(canvas, 'PARIS SG', Offset(cx, cy + r * 0.53), r * 0.15, const Color(0xFFFFD700));

    canvas.restore();
    canvas.drawPath(inner,
        Paint()..color = const Color(0xFFFFD700)..style = PaintingStyle.stroke..strokeWidth = r * 0.05);
  }

  void _drawGeneric(Canvas canvas, double cx, double cy, double r) {
    canvas.drawCircle(Offset(cx, cy), r, Paint()..color = Colors.grey[400]!);
    canvas.drawCircle(Offset(cx, cy), r * 0.7, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CrestPainter old) => old.team != team;
}

// ─── Jersey Painter ───────────────────────────────────────────────────────────

class JerseyPainter extends CustomPainter {
  final Color primary;
  final Color secondary;
  final Color accent;
  final bool showBack;
  final int number;
  final String playerName;
  final String team;

  const JerseyPainter({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.showBack,
    required this.number,
    required this.playerName,
    required this.team,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Jersey body
    final jerseyPath = Path()
      ..moveTo(w * 0.22, 0)
      ..lineTo(w * 0.05, h * 0.22)
      ..lineTo(0,        h * 0.35)
      ..lineTo(w * 0.12, h * 0.38)
      ..lineTo(w * 0.18, h * 0.25)
      ..lineTo(w * 0.15, h)
      ..lineTo(w * 0.85, h)
      ..lineTo(w * 0.82, h * 0.25)
      ..lineTo(w * 0.88, h * 0.38)
      ..lineTo(w,        h * 0.35)
      ..lineTo(w * 0.95, h * 0.22)
      ..lineTo(w * 0.78, 0)
      ..close();

    // Fill
    final safeColor = primary == Colors.white ? const Color(0xFFF2F2F2) : primary;
    canvas.drawPath(jerseyPath, Paint()..color = safeColor);

    // Team design overlay
    canvas.save();
    canvas.clipPath(jerseyPath);
    _drawDesign(canvas, size);
    canvas.restore();

    // Outline
    final outlineColor = secondary == Colors.white ? Colors.grey[350]! : secondary;
    canvas.drawPath(jerseyPath,
        Paint()..color = outlineColor..style = PaintingStyle.stroke..strokeWidth = w * 0.015);

    // Collar
    final collarFill = secondary == Colors.white ? const Color(0xFFE0E0E0) : secondary;
    final collarPath = Path()
      ..moveTo(w * 0.34, 0)
      ..quadraticBezierTo(w * 0.37, h * 0.11, w * 0.5, h * 0.13)
      ..quadraticBezierTo(w * 0.63, h * 0.11, w * 0.66, 0)
      ..close();
    canvas.drawPath(collarPath, Paint()..color = collarFill);
    canvas.drawPath(collarPath,
        Paint()..color = outlineColor..style = PaintingStyle.stroke..strokeWidth = w * 0.012);

    // Front / Back content
    if (!showBack) {
      // Crest — positioned high up
      final crestSize = w * 0.34;
      canvas.save();
      canvas.translate(w * 0.29, h * 0.15);
      CrestPainter(team).paint(canvas, Size(crestSize, crestSize));
      canvas.restore();
    } else {
      // Number — large, high on jersey
      _drawText(canvas, '$number',
          Offset(w * 0.5, h * 0.30),
          w * 0.36, accent, FontWeight.bold);
      // Name — just below number
      _drawText(canvas, playerName,
          Offset(w * 0.5, h * 0.58),
          w * 0.095, accent, FontWeight.bold);
    }
  }

  void _drawDesign(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final sp = Paint()..color = secondary.withOpacity(0.40);

    switch (team) {
      case 'FC Barcelona':
        final sw = w * 0.115;
        for (int i = 0; i < 6; i++) {
          canvas.drawRect(Rect.fromLTWH(i * sw * 2 - w * 0.1, 0, sw, h), sp);
        }
        break;
      case 'Real Madrid':
        canvas.drawRect(Rect.fromLTWH(0, 0, w, h),
            Paint()
              ..shader = LinearGradient(
                colors: [Colors.transparent, secondary.withOpacity(0.12)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0, 0, w, h)));
        break;
      case 'Liverpool FC':
        final pin = Paint()
          ..color = secondary.withOpacity(0.18)
          ..strokeWidth = w * 0.01;
        for (int i = 0; i < 10; i++) {
          canvas.drawLine(Offset(i * w * 0.1, 0), Offset(i * w * 0.1, h), pin);
        }
        break;
      case 'Bayern Munich':
        canvas.drawRect(Rect.fromLTWH(0, h * 0.33, w, h * 0.1), sp);
        break;
      case 'Manchester United':
        canvas.drawRect(Rect.fromLTWH(0, 0, w * 0.28, h),
            Paint()..color = Colors.black.withOpacity(0.07));
        break;
      case 'Paris Saint-Germain':
        final diag = Paint()
          ..color = secondary.withOpacity(0.22)
          ..strokeWidth = w * 0.18;
        canvas.drawLine(Offset(0, h * 0.15), Offset(w, h * 0.85), diag);
        break;
    }
  }

  void _drawText(Canvas canvas, String text, Offset center, double fontSize,
      Color color, FontWeight weight) {
    final safeColor = color == Colors.white ? Colors.white : color;
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: safeColor,
          fontSize: fontSize,
          fontWeight: weight,
          letterSpacing: 1.5,
          shadows: [
            Shadow(color: Colors.black.withOpacity(0.5),
                offset: const Offset(1.5, 1.5), blurRadius: 3),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, center - Offset(tp.width / 2, tp.height / 2));
  }

  @override
  bool shouldRepaint(JerseyPainter old) =>
      old.showBack   != showBack   ||
      old.primary    != primary    ||
      old.secondary  != secondary  ||
      old.accent     != accent     ||
      old.number     != number     ||
      old.playerName != playerName ||
      old.team       != team;
}

// ─── Product Card ─────────────────────────────────────────────────────────────

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback? onFavoriteChanged;

  const ProductCard({Key? key, required this.product, this.onFavoriteChanged})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isHome = true;
  bool _showBack = false;
  String _selectedSize = 'L';

  JerseyVariant get v => _isHome ? widget.product.home : widget.product.away;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final isSoldOut = v.stockQuantity == 0;
    final headerColor = v.primaryColor == Colors.white
        ? const Color(0xFF1565C0)
        : v.primaryColor;

    return Card(
      elevation: 5,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          // ── Header ────────────────────────────────────────────────────────
          Container(
            color: headerColor,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Row(children: [
              Expanded(
                child: Text(p.team,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                    overflow: TextOverflow.ellipsis),
              ),
              GestureDetector(
                onTap: () {
                  setState(() => p.toggleFavorite());
                  widget.onFavoriteChanged?.call();
                },
                child: Icon(
                    p.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: p.isFavorite ? Colors.pinkAccent : Colors.white70,
                    size: 18),
              ),
            ]),
          ),

          // ── HOME / AWAY toggle ────────────────────────────────────────────
          Container(
            margin: const EdgeInsets.fromLTRB(6, 6, 6, 0),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            child: Row(children: [
              _toggleTab('HOME', true),
              _toggleTab('AWAY', false),
            ]),
          ),

          // ── Jersey ────────────────────────────────────────────────────────
          Expanded(
            flex: 5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() => _showBack = !_showBack),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: AspectRatio(
                      aspectRatio: 0.75,
                      child: CustomPaint(
                        key: ValueKey('${_isHome}_$_showBack'),
                        painter: JerseyPainter(
                          primary:    v.primaryColor,
                          secondary:  v.secondaryColor,
                          accent:     v.accentColor,
                          showBack:   _showBack,
                          number:     v.jerseyNumber,
                          playerName: v.playerName,
                          team:       p.team,
                        ),
                      ),
                    ),
                  ),
                ),
                if (isSoldOut)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.55),
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius: BorderRadius.circular(6)),
                        child: const Text('SOLD OUT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 4, right: 6,
                  child: Text(_showBack ? '↺ Front' : '↺ Back',
                      style: TextStyle(fontSize: 9, color: Colors.grey[500])),
                ),
              ],
            ),
          ),

          // ── Info ──────────────────────────────────────────────────────────
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text('\$${v.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700])),
                    const Spacer(),
                    if (p.isAuthentic)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text('AUTH',
                            style: TextStyle(
                                color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                      ),
                  ]),
                  const SizedBox(height: 3),
                  Text('${v.playerName}  #${v.jerseyNumber}',
                      style: TextStyle(
                          fontSize: 10, color: Colors.grey[700], fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 3),
                  Wrap(spacing: 3, children: [
                    _chip(p.season, Colors.blue[100]!),
                    _chip(v.jerseyType, Colors.orange[100]!),
                  ]),
                  const SizedBox(height: 4),
                  Text(p.material,
                      style: TextStyle(fontSize: 8, color: Colors.grey[500]),
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 3),
                  _stockBar(v.stockQuantity),
                  const SizedBox(height: 4),
                  // Size selector
                  SizedBox(
                    height: 22,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: p.availableSizes.map((s) {
                        final sel = _selectedSize == s;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedSize = s),
                          child: Container(
                            margin: const EdgeInsets.only(right: 3),
                            width: 24,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: sel ? headerColor : Colors.grey[200],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(s,
                                style: TextStyle(
                                    fontSize: 8,
                                    color: sel ? Colors.white : Colors.black87,
                                    fontWeight: FontWeight.bold)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _toggleTab(String label, bool isHomeTab) {
    final isActive = _isHome == isHomeTab;
    final variant = isHomeTab ? widget.product.home : widget.product.away;
    final tabColor = variant.primaryColor == Colors.white
        ? const Color(0xFF1565C0)
        : variant.primaryColor;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (_isHome != isHomeTab) {
            setState(() {
              _isHome = isHomeTab;
              _showBack = false;
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: isActive ? tabColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(label,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.white : Colors.grey[600])),
        ),
      ),
    );
  }

  Widget _chip(String label, Color bg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(4)),
        child: Text(label, style: const TextStyle(fontSize: 8)),
      );

  Widget _stockBar(int qty) {
    final ratio = (qty / 20).clamp(0.0, 1.0);
    final color = qty == 0 ? Colors.red : qty < 5 ? Colors.orange : Colors.green[600]!;
    return Row(children: [
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: LinearProgressIndicator(
              value: ratio,
              backgroundColor: Colors.grey[300],
              color: color,
              minHeight: 5),
        ),
      ),
      const SizedBox(width: 4),
      Text('$qty', style: TextStyle(fontSize: 8, color: color, fontWeight: FontWeight.bold)),
    ]);
  }
}
