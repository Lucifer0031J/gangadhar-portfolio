import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isWide = MediaQuery.of(context).size.width > 800;

    return Container(
      color: isDark ? const Color(0xFF070E1A) : const Color(0xFFE8F0F8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(
            title: 'Skills',
            subtitle: 'Arsenal & capabilities',
            accentColor: AppTheme.ironGold,
          ),
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

  Widget _buildCategorySelector(bool isDark) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ResumeData.skills.asMap().entries.map((entry) {
          final idx = entry.key;
          final cat = entry.value;
          final selected = idx == _selectedCategory;
          final color = Color(cat.color);

          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = idx),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: selected ? color : (isDark ? AppTheme.darkCard : Colors.white),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selected ? color : color.withOpacity(0.3),
                ),
                boxShadow: selected
                    ? [BoxShadow(color: color.withOpacity(0.3), blurRadius: 12)]
                    : [],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(cat.icon, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 6),
                  Text(
                    cat.name,
                    style: GoogleFonts.rajdhani(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: selected
                          ? (isDark ? AppTheme.darkBg : Colors.white)
                          : color,
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
                    Text(cat.icon, style: const TextStyle(fontSize: 28)),
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
                  percent: s.proficiency,
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
              Text(cat.icon, style: const TextStyle(fontSize: 24)),
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
            percent: s.proficiency,
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
          color: isDark ? AppTheme.textSecondary : Colors.black45,
          letterSpacing: 2,
        ),
      ),
      const SizedBox(height: 12),
      ...competencies.map((c) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: GlowCard(
          glowColor: c.$3,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Text(c.$1, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  c.$2,
                  style: GoogleFonts.rajdhani(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: c.$3,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    ];
  }
}
