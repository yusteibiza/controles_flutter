import 'dart:math';
import 'package:flutter/material.dart';

class ExplosionInkWell extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color particleColor;

  const ExplosionInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.particleColor = Colors.orange,
  });

  @override
  State<ExplosionInkWell> createState() => _ExplosionInkWellState();
}

class _ExplosionInkWellState extends State<ExplosionInkWell>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  bool _isExploding = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _explode(Offset center) {
    if (_isExploding) return;
    _isExploding = true;
    _particles.clear();

    final random = Random();
    for (int i = 0; i < 40; i++) {
      final angle = random.nextDouble() * 2 * pi;
      final speed = 150 + random.nextDouble() * 200;
      _particles.add(
        _Particle(
          position: center,
          velocity: Offset(cos(angle) * speed, sin(angle) * speed),
          size: 3 + random.nextDouble() * 5,
          color: [
            Colors.orange,
            Colors.red,
            Colors.yellow,
            Colors.deepOrange,
          ][random.nextInt(4)],
        ),
      );
    }
    _controller.forward(from: 0).then((_) {
      _isExploding = false;
      _particles.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _explode(details.localPosition),
      onTap: widget.onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          widget.child,
          if (_controller.isAnimating)
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: _ExplosionPainter(
                    particles: _particles,
                    progress: _controller.value,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Particle {
  Offset position;
  final Offset velocity;
  final double size;
  final Color color;

  _Particle({
    required this.position,
    required this.velocity,
    required this.size,
    required this.color,
  });
}

class _ExplosionPainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;

  _ExplosionPainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      final currentPos = Offset(
        particle.position.dx + particle.velocity.dx * progress,
        particle.position.dy +
            particle.velocity.dy * progress +
            100 * progress * progress,
      );
      final opacity = (1 - progress).clamp(0.0, 1.0);
      final currentSize = particle.size * (1 - progress * 0.5);

      final paint = Paint()
        ..color = particle.color.withOpacity(opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(currentPos, currentSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ExplosionPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
