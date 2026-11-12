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
    final effectiveGlowColor = isDark
        ? widget.glowColor
        : (widget.glowColor == AppTheme.arcReactor
            ? AppTheme.arcReactorLight
            : (widget.glowColor == AppTheme.ironGold
                ? AppTheme.ironGoldLight
                : (widget.glowColor == AppTheme.cyberGreen
                    ? AppTheme.cyberGreenLight
                    : widget.glowColor)));

    return MouseRegion(
      onEnter: (_) => widget.isHoverable ? setState(() => _isHovered = true) : null,
      onExit: (_) => widget.isHoverable ? setState(() => _isHovered = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: widget.padding ?? const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
            color: _isHovered
                ? effectiveGlowColor.withOpacity(0.9)
                : effectiveGlowColor.withOpacity(isDark ? 0.25 : 0.4),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: effectiveGlowColor.withOpacity(isDark ? 0.3 : 0.22),
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ]
              : [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.3)
                        : const Color(0xFF0A192F).withOpacity(0.06),
                    blurRadius: 10,
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
    final effectiveColor = isDark
        ? accentColor
        : (accentColor == AppTheme.arcReactor
            ? AppTheme.arcReactorLight
            : (accentColor == AppTheme.ironGold
                ? AppTheme.ironGoldLight
                : (accentColor == AppTheme.cyberGreen
                    ? AppTheme.cyberGreenLight
                    : (accentColor == AppTheme.redAlert ? AppTheme.redAlertLight : accentColor))));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 36,
              decoration: BoxDecoration(
                color: effectiveColor,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(color: effectiveColor.withOpacity(isDark ? 0.6 : 0.4), blurRadius: 8),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: isDark ? AppTheme.textPrimary : AppTheme.textPrimaryLight,
                letterSpacing: 3,
                fontWeight: FontWeight.w700,
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
              color: isDark ? effectiveColor.withOpacity(0.85) : AppTheme.textSecondaryLight,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
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
                  color: effectiveColor,
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: [BoxShadow(color: effectiveColor.withOpacity(0.5), blurRadius: 6)],
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: effectiveColor,
                  boxShadow: [BoxShadow(color: effectiveColor.withOpacity(0.8), blurRadius: 8)],
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
    final effectiveColor = isDark
        ? widget.color
        : (widget.color == AppTheme.arcReactor
            ? AppTheme.arcReactorLight
            : (widget.color == AppTheme.ironGold
                ? AppTheme.ironGoldLight
                : (widget.color == AppTheme.cyberGreen
                    ? AppTheme.cyberGreenLight
                    : (widget.color == AppTheme.redAlert ? AppTheme.redAlertLight : widget.color))));

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
                  color: isDark ? AppTheme.textPrimary : AppTheme.textPrimaryLight,
                  fontWeight: FontWeight.w600,
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
                      color: effectiveColor,
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
                        colors: [effectiveColor.withOpacity(0.7), effectiveColor],
                      ),
                      borderRadius: BorderRadius.circular(1),
                      boxShadow: [
                        BoxShadow(color: effectiveColor.withOpacity(isDark ? 0.5 : 0.25), blurRadius: 6),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final effectiveColor = isDark
        ? color
        : (color == AppTheme.arcReactor
            ? AppTheme.arcReactorLight
            : (color == AppTheme.ironGold
                ? AppTheme.ironGoldLight
                : (color == AppTheme.cyberGreen
                    ? AppTheme.cyberGreenLight
                    : (color == AppTheme.redAlert ? AppTheme.redAlertLight : color))));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: effectiveColor.withOpacity(isDark ? 0.12 : 0.08),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: effectiveColor.withOpacity(isDark ? 0.4 : 0.5), width: 1),
      ),
      child: Text(
        label,
        style: GoogleFonts.rajdhani(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: effectiveColor,
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final effectiveColor = isDark
        ? color
        : (color == AppTheme.arcReactor
            ? AppTheme.arcReactorLight
            : (color == AppTheme.ironGold
                ? AppTheme.ironGoldLight
                : (color == AppTheme.cyberGreen
                    ? AppTheme.cyberGreenLight
                    : (color == AppTheme.redAlert ? AppTheme.redAlertLight : color))));

    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, effectiveColor.withOpacity(isDark ? 0.6 : 0.4), Colors.transparent],
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
    final effectiveColor = isDark
        ? color
        : (color == AppTheme.arcReactor
            ? AppTheme.arcReactorLight
            : (color == AppTheme.ironGold
                ? AppTheme.ironGoldLight
                : (color == AppTheme.cyberGreen
                    ? AppTheme.cyberGreenLight
                    : (color == AppTheme.redAlert ? AppTheme.redAlertLight : color))));

    return GlowCard(
      glowColor: effectiveColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: effectiveColor),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.rajdhani(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: effectiveColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? AppTheme.textSecondary : AppTheme.textSecondaryLight,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
