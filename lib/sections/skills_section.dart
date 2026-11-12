import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';
import '../utils/jarvis_voice.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedCategory = 0;
  int _headerTaps = 0;
  bool _showSkillsEgg = false;

  void _triggerSkillsEasterEgg() {
    setState(() => _headerTaps++);
    if (_headerTaps >= 3) {
      setState(() => _showSkillsEgg = true);
      JarvisVoice.speak(
          "Tactical operational systems running at 100 percent. Web, API, mobile, and DevSecOps defenses secured, sir.");
      Future.delayed(const Duration(seconds: 7), () {
        if (mounted) setState(() => _showSkillsEgg = false);
      });
      _headerTaps = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isWide = MediaQuery.of(context).size.width > 800;

    return Container(
      color: isDark ? const Color(0xFF070E1A) : AppTheme.lightAltBg,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          GestureDetector(
            onTap: _triggerSkillsEasterEgg,
            child: const SectionHeader(
              title: 'Operational Capabilities',
              subtitle: 'System tools and proficiencies',
              accentColor: AppTheme.ironGold,
            ),
          ),
          if (_showSkillsEgg) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightSurface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: (isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight).withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(
                    color: (isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight).withOpacity(isDark ? 0.3 : 0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.record_voice_over_rounded, size: 14, color: isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight),
                  const SizedBox(width: 8),
                  Text(
                    'J.A.R.V.I.S.: Tactical telemetry 100% operational.',
                    style: GoogleFonts.rajdhani(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => JarvisVoice.speak(
                        "Tactical operational systems running at 100 percent. Web, API, mobile, and DevSecOps defenses secured, sir."),
                    child: Icon(Icons.volume_up_rounded, size: 14, color: isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 300.ms),
          ],
          const SizedBox(height: 40),

          // Category Selector
          _buildCategorySelector(isDark),
          const SizedBox(height: 32),

          // Skills display
          isWide
              ? _buildWideLayout(context, isDark)
              : _buildNarrowLayout(context, isDark),
        ],
      ),
    );
  }

  IconData _getIconForEmoji(String emoji) {
    switch (emoji) {
      case '🛡️': return Icons.security_rounded;
      case '⚙️': return Icons.settings_suggest_rounded;
      case '✅': return Icons.verified_rounded;
      case '💻': return Icons.computer_rounded;
      case '🔍': return Icons.search_rounded;
      case '🐛': return Icons.bug_report_rounded;
      case '🤖': return Icons.smart_toy_rounded;
      case '📋': return Icons.assignment_rounded;
      case '⚔️': return Icons.hardware_rounded;
      default: return Icons.memory_rounded;
    }
  }

  Widget _buildCategorySelector(bool isDark) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ResumeData.skills.asMap().entries.map((entry) {
          final idx = entry.key;
          final cat = entry.value;
          final selected = idx == _selectedCategory;
          final rawColor = Color(cat.color);
          final color = isDark
              ? rawColor
              : (rawColor.value == AppTheme.arcReactor.value
                  ? AppTheme.arcReactorLight
                  : (rawColor.value == AppTheme.ironGold.value
                      ? AppTheme.ironGoldLight
                      : (rawColor.value == AppTheme.cyberGreen.value
                          ? AppTheme.cyberGreenLight
                          : (rawColor.value == AppTheme.redAlert.value ? AppTheme.redAlertLight : rawColor))));

          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = idx),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: selected ? color : (isDark ? AppTheme.darkCard : AppTheme.lightSurface),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selected ? color : color.withOpacity(isDark ? 0.3 : 0.45),
                ),
                boxShadow: selected
                    ? [BoxShadow(color: color.withOpacity(isDark ? 0.3 : 0.25), blurRadius: 12)]
                    : [
                        if (!isDark)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                      ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_getIconForEmoji(cat.icon), size: 16, color: selected ? Colors.white : color),
                  const SizedBox(width: 6),
                  Text(
                    cat.name,
                    style: GoogleFonts.rajdhani(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: selected ? Colors.white : color,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildWideLayout(BuildContext context, bool isDark) {
    final cat = ResumeData.skills[_selectedCategory];
    final color = Color(cat.color);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GlowCard(
            glowColor: color,
            key: ValueKey(_selectedCategory),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(_getIconForEmoji(cat.icon), size: 28, color: color),
                    const SizedBox(width: 10),
                    Text(
                      cat.name.toUpperCase(),
                      style: GoogleFonts.rajdhani(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: color,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ...cat.items.map((s) => AnimatedSkillBar(
                  name: s.name,
                  level: s.level,
                  color: color,
                )),
              ],
            ),
          ).animate(key: ValueKey(_selectedCategory)).fadeIn(duration: 400.ms).slideX(begin: 0.1, end: 0),
        ),
        const SizedBox(width: 24),
        SizedBox(
          width: 200,
          child: Column(
            children: _buildCoreCompetencies(context, isDark),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context, bool isDark) {
    final cat = ResumeData.skills[_selectedCategory];
    final color = Color(cat.color);

    return GlowCard(
      key: ValueKey(_selectedCategory),
      glowColor: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(_getIconForEmoji(cat.icon), size: 24, color: color),
              const SizedBox(width: 8),
              Text(
                cat.name.toUpperCase(),
                style: GoogleFonts.rajdhani(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: color,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...cat.items.map((s) => AnimatedSkillBar(
            name: s.name,
            level: s.level,
            color: color,
          )),
        ],
      ),
    ).animate(key: ValueKey(_selectedCategory)).fadeIn(duration: 400.ms);
  }

  List<Widget> _buildCoreCompetencies(BuildContext context, bool isDark) {
    final competencies = [
      ('🛡️', 'VAPT', AppTheme.arcReactor),
      ('🔍', 'Threat Modeling', AppTheme.ironGold),
      ('🐛', 'Bug Bounty', AppTheme.cyberGreen),
      ('🤖', 'Security Automation', AppTheme.arcReactor),
      ('📋', 'PCI-DSS / RBI', AppTheme.ironGold),
      ('⚔️', 'Offensive Security', AppTheme.redAlert),
    ];

    return [
      Text(
        'CORE COMPETENCIES',
        style: GoogleFonts.rajdhani(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: isDark ? AppTheme.textSecondary : AppTheme.textSecondaryLight,
          letterSpacing: 2,
        ),
      ),
      const SizedBox(height: 12),
      ...competencies.map((c) {
        final raw = c.$3;
        final color = isDark
            ? raw
            : (raw == AppTheme.arcReactor
                ? AppTheme.arcReactorLight
                : (raw == AppTheme.ironGold
                    ? AppTheme.ironGoldLight
                    : (raw == AppTheme.cyberGreen
                        ? AppTheme.cyberGreenLight
                        : (raw == AppTheme.redAlert ? AppTheme.redAlertLight : raw))));

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GlowCard(
            glowColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Icon(_getIconForEmoji(c.$1), size: 16, color: color),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    c.$2,
                    style: GoogleFonts.rajdhani(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: color,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ];
  }
}
