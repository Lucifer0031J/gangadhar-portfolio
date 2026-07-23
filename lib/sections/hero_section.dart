import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _pulseCtrl;
  late AnimationController _rotateCtrl;
  late AnimationController _particleCtrl;
  int _tapCount = 0;
  bool _showEasterEgg = false;
  String _easterEggText = '';
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _rotateCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _particleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    _rotateCtrl.dispose();
    _particleCtrl.dispose();
    super.dispose();
  }

  void _handleAvatarTap() {
    setState(() => _tapCount++);
    if (_tapCount == 5) {
      setState(() {
        _showEasterEgg = true;
        _easterEggText = ResumeData.easterEggs[0];
      });
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) setState(() => _showEasterEgg = false);
      });
      _tapCount = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 800;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: size.height),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.3, -0.5),
          radius: 1.2,
          colors: isDark
              ? [
                  const Color(0xFF0A1628),
                  const Color(0xFF050A14),
                  const Color(0xFF020507),
                ]
              : [
                  const Color(0xFFDEEFF8),
                  const Color(0xFFF0F6FF),
                  const Color(0xFFFFFFFF),
                ],
        ),
      ),
      child: Stack(
        children: [
          // Background grid pattern
          Positioned.fill(child: _buildGridOverlay(isDark)),
          // Floating particles
          ..._buildParticles(isDark),
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
              child: isWide
                  ? _buildWideLayout(context, isDark)
                  : _buildNarrowLayout(context, isDark),
            ),
          ),
          // Easter egg overlay
          if (_showEasterEgg) _buildEasterEggOverlay(context),
        ],
      ),
    );
  }

  Widget _buildGridOverlay(bool isDark) {
    return CustomPaint(
      painter: _GridPainter(isDark ? AppTheme.arcReactor.withOpacity(0.04) : Colors.blue.withOpacity(0.04)),
    );
  }

  List<Widget> _buildParticles(bool isDark) {
    return List.generate(12, (i) {
      final size = _random.nextDouble() * 3 + 1;
      final left = _random.nextDouble();
      final top = _random.nextDouble();
      final color = i % 3 == 0
          ? AppTheme.arcReactor
          : i % 3 == 1
              ? AppTheme.ironGold
              : AppTheme.cyberGreen;

      return Positioned(
        left: MediaQuery.of(context).size.width * left,
        top: MediaQuery.of(context).size.height * top,
        child: AnimatedBuilder(
          animation: _particleCtrl,
          builder: (_, __) {
            final offset = sin(_particleCtrl.value * 2 * pi + i) * 10;
            return Transform.translate(
              offset: Offset(0, offset),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(isDark ? 0.6 : 0.4),
                  boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 4)],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _buildWideLayout(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: _buildTextContent(context, isDark)),
        const SizedBox(width: 60),
        _buildAvatarSection(context, isDark),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context, bool isDark) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvatarSection(context, isDark),
        const SizedBox(height: 40),
        _buildTextContent(context, isDark),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, bool isDark) {
    final color = isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Greeting tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.arcReactor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppTheme.arcReactor.withOpacity(0.3)),
          ),
          child: Text(
            '[ IDENTITY VERIFIED ]',
            style: GoogleFonts.rajdhani(
              fontSize: 12,
              color: AppTheme.arcReactor,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2, end: 0),

        const SizedBox(height: 16),

        // Name
        Text(
          'GANGADHAR\nPOOSARLA',
          style: GoogleFonts.rajdhani(
            fontSize: MediaQuery.of(context).size.width > 600 ? 60 : 42,
            fontWeight: FontWeight.w700,
            color: color,
            height: 0.95,
            letterSpacing: 2,
          ),
        ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3, end: 0),

        const SizedBox(height: 16),

        // Animated title
        Row(
          children: [
            AnimatedBuilder(
              animation: _pulseCtrl,
              builder: (_, __) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.cyberGreen,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.cyberGreen.withOpacity(0.5 + _pulseCtrl.value * 0.5),
                      blurRadius: 8 + _pulseCtrl.value * 8,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Application Security Engineer\n\nWeb • API • Android\n\nBuilding secure software.\nBreaking insecure software.\nAutomating everything in between.',
                    textStyle: GoogleFonts.rajdhani(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.arcReactor,
                      letterSpacing: 1,
                      height: 1.5,
                    ),
                    speed: const Duration(milliseconds: 40),
                  ),
                ],
              ),
            ),
          ],
        ).animate().fadeIn(delay: 600.ms),

        const SizedBox(height: 20),

        // Quick stats
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            _statBadge('40+', 'Apps Secured', AppTheme.arcReactor),
            _statBadge('92%', 'Closure Rate', AppTheme.cyberGreen),
            _statBadge('30+', 'CVEs Found', AppTheme.ironGold),
            _statBadge('15+', 'Hrs/Week Saved', AppTheme.redAlert),
          ],
        ).animate().fadeIn(delay: 800.ms),

        const SizedBox(height: 28),

        // CTA Buttons
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            _buildPrimaryButton(context),
            _buildApkButton(context, isDark),
            _buildSecondaryButton(context, isDark),
          ],
        ).animate().fadeIn(delay: 1000.ms),

        const SizedBox(height: 24),

        // Location
        Row(
          children: [
            Icon(Icons.location_on_rounded, size: 16,
                color: isDark ? AppTheme.textSecondary : Colors.black45),
            const SizedBox(width: 4),
            Text(
              'Visakhapatnam, India  •  Available for opportunities',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isDark ? AppTheme.textSecondary : Colors.black45,
                fontSize: 13,
              ),
            ),
          ],
        ).animate().fadeIn(delay: 1100.ms),
      ],
    );
  }

  Widget _statBadge(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: GoogleFonts.rajdhani(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.download_rounded, size: 18),
      label: const Text('DOWNLOAD CV'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.arcReactor,
        foregroundColor: AppTheme.darkBg,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.rajdhani(fontWeight: FontWeight.w700, letterSpacing: 1.5, fontSize: 14),
      ),
    );
  }

  Widget _buildApkButton(BuildContext context, bool isDark) {
    return ElevatedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(ResumeData.apkUrl);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      icon: const Icon(Icons.android_rounded, size: 18),
      label: const Text('LAUNCH ANDROID PORTFOLIO'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.cyberGreen,
        foregroundColor: AppTheme.darkBg,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.rajdhani(fontWeight: FontWeight.w700, letterSpacing: 1.5, fontSize: 14),
      ),
    );
  }

  Widget _buildSecondaryButton(BuildContext context, bool isDark) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.mail_outline_rounded, size: 18,
          color: isDark ? AppTheme.textPrimary : AppTheme.darkBg),
      label: Text(
        'GET IN TOUCH',
        style: GoogleFonts.rajdhani(
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
          fontSize: 14,
          color: isDark ? AppTheme.textPrimary : AppTheme.darkBg,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        side: BorderSide(color: isDark ? AppTheme.textSecondary : Colors.black38),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildAvatarSection(BuildContext context, bool isDark) {
    return GestureDetector(
      onTap: _handleAvatarTap,
      child: SizedBox(
        width: 260,
        height: 260,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer rotating ring
            AnimatedBuilder(
              animation: _rotateCtrl,
              builder: (_, __) => Transform.rotate(
                angle: _rotateCtrl.value * 2 * pi,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.arcReactor.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: CustomPaint(painter: _DashedCirclePainter(AppTheme.arcReactor)),
                ),
              ),
            ),
            // Pulsing glow ring
            AnimatedBuilder(
              animation: _pulseCtrl,
              builder: (_, __) => Container(
                width: 220 + _pulseCtrl.value * 10,
                height: 220 + _pulseCtrl.value * 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.arcReactor.withOpacity(0.1 + _pulseCtrl.value * 0.2),
                    width: 2,
                  ),
                ),
              ),
            ),
            // Avatar circle
            AnimatedBuilder(
              animation: _rotateCtrl,
              builder: (_, __) => Transform.rotate(
                angle: -_rotateCtrl.value * 2 * pi,
                child: Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF1A3A5C), Color(0xFF0D1B2A)],
                    ),
                    border: Border.all(color: AppTheme.arcReactor.withOpacity(0.5), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.arcReactor.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('GP', style: GoogleFonts.rajdhani(
                        fontSize: 56,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.arcReactor,
                        letterSpacing: 4,
                      )),
                      Text('[ TAP 5× ]', style: GoogleFonts.rajdhani(
                        fontSize: 9,
                        color: AppTheme.arcReactor.withOpacity(0.4),
                        letterSpacing: 2,
                      )),
                    ],
                  ),
                ),
              ),
            ),
            // Arc reactor dot at center-bottom
            Positioned(
              bottom: 22,
              child: AnimatedBuilder(
                animation: _pulseCtrl,
                builder: (_, __) => Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.arcReactor,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.arcReactor.withOpacity(0.4 + _pulseCtrl.value * 0.6),
                        blurRadius: 12 + _pulseCtrl.value * 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1), delay: 200.ms, duration: 600.ms);
  }

  Widget _buildEasterEggOverlay(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.darkCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.ironGold.withOpacity(0.5)),
          boxShadow: [BoxShadow(color: AppTheme.ironGold.withOpacity(0.2), blurRadius: 20)],
        ),
        child: Row(
          children: [
            const Text('🦾', style: TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _easterEggText,
                style: GoogleFonts.rajdhani(
                  fontSize: 14,
                  color: AppTheme.ironGold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.5, end: 0),
    );
  }
}

// ─── Custom Painters ──────────────────────────────────────────────────────────
class _GridPainter extends CustomPainter {
  final Color color;
  _GridPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..strokeWidth = 0.5;
    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => false;
}

class _DashedCirclePainter extends CustomPainter {
  final Color color;
  _DashedCirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.4)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 1;
    const dashCount = 24;
    const dashLength = pi / dashCount * 0.6;

    for (int i = 0; i < dashCount; i++) {
      final startAngle = i * (2 * pi / dashCount);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        dashLength,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_DashedCirclePainter old) => false;
}
