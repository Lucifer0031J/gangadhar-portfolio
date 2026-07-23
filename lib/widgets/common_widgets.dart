import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

// ─── Glowing Border Container ─────────────────────────────────────────────────
class GlowCard extends StatefulWidget {
  final Widget child;
  final Color glowColor;
  final double borderRadius;
  final EdgeInsets? padding;
  final bool isHoverable;

  const GlowCard({
    super.key,
    required this.child,
    this.glowColor = AppTheme.arcReactor,
    this.borderRadius = 16,
    this.padding,
    this.isHoverable = true,
  });

  @override
  State<GlowCard> createState() => _GlowCardState();
}

class _GlowCardState extends State<GlowCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      onEnter: (_) => widget.isHoverable ? setState(() => _isHovered = true) : null,
      onExit: (_) => widget.isHoverable ? setState(() => _isHovered = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: widget.padding ?? const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: _isHovered
                ? widget.glowColor.withOpacity(0.8)
                : widget.glowColor.withOpacity(isDark ? 0.2 : 0.3),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.glowColor.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
        ),
        child: widget.child,
      ),
    );
  }
}

// ─── Section Header with animated accent line ─────────────────────────────────
class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color accentColor;

  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.accentColor = AppTheme.arcReactor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 36,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(color: accentColor.withOpacity(0.6), blurRadius: 8),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                letterSpacing: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: accentColor.withOpacity(0.8),
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 2,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: [BoxShadow(color: accentColor.withOpacity(0.5), blurRadius: 6)],
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accentColor,
                  boxShadow: [BoxShadow(color: accentColor.withOpacity(0.8), blurRadius: 8)],
                ),
              ),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1, end: 0);
  }
}

// ─── Skill Bar ────────────────────────────────────────────────────────────────
class AnimatedSkillBar extends StatefulWidget {
  final String name;
  final String level;
  final Color color;

  const AnimatedSkillBar({
    super.key,
    required this.name,
    required this.level,
    required this.color,
  });

  @override
  State<AnimatedSkillBar> createState() => _AnimatedSkillBarState();
}

class _AnimatedSkillBarState extends State<AnimatedSkillBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                  fontWeight: FontWeight.w500,
                ),
              ),
              AnimatedBuilder(
                animation: _anim,
                builder: (_, __) => Opacity(
                  opacity: _anim.value,
                  child: Text(
                    '✔ ${widget.level}',
                    style: GoogleFonts.rajdhani(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: widget.color,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Stack(
            children: [
              Container(
                height: 2,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white12 : Colors.black12,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              AnimatedBuilder(
                animation: _anim,
                builder: (_, __) => FractionallySizedBox(
                  widthFactor: _anim.value,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [widget.color.withOpacity(0.7), widget.color],
                      ),
                      borderRadius: BorderRadius.circular(1),
                      boxShadow: [
                        BoxShadow(color: widget.color.withOpacity(0.5), blurRadius: 6),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Cyber Tag Chip ───────────────────────────────────────────────────────────
class CyberTag extends StatelessWidget {
  final String label;
  final Color color;

  const CyberTag({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.4), width: 1),
      ),
      child: Text(
        label,
        style: GoogleFonts.rajdhani(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ─── Animated Neon Divider ────────────────────────────────────────────────────
class NeonDivider extends StatelessWidget {
  final Color color;
  const NeonDivider({super.key, this.color = AppTheme.arcReactor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, color.withOpacity(0.6), Colors.transparent],
        ),
      ),
    );
  }
}

// ─── Holographic Stat Card ────────────────────────────────────────────────────
class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final IconData icon;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GlowCard(
      glowColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.rajdhani(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? AppTheme.textSecondary : Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
