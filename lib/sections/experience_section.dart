import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  int _expanded = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(
            title: 'Mission Logs',
            subtitle: 'Battle log & deployments',
            accentColor: AppTheme.cyberGreen,
          ),
          const SizedBox(height: 40),
          ...ResumeData.experiences.asMap().entries.map((entry) {
            final idx = entry.key;
            final exp = entry.value;
            return _buildTimelineCard(context, isDark, idx, exp);
          }),
          const SizedBox(height: 16),
          _buildBugBountyBanner(context, isDark),
        ],
      ),
    );
  }

  Widget _buildTimelineCard(BuildContext context, bool isDark, int idx, MissionLog exp) {
    final color = Color(exp.color);
    final isExpanded = _expanded == idx;
    final isCurrent = exp.status == 'ACTIVE';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline column
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCurrent ? color : color.withOpacity(0.5),
                  border: Border.all(color: color, width: 2),
                  boxShadow: isCurrent
                      ? [BoxShadow(color: color.withOpacity(0.5), blurRadius: 8)]
                      : [],
                ),
              ),
              if (idx < ResumeData.experiences.length - 1)
                Container(
                  width: 2,
                  height: isExpanded ? 360 : 90,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [color.withOpacity(0.5), Colors.transparent],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Card
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _expanded = isExpanded ? -1 : idx),
              child: GlowCard(
                glowColor: color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: color.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: color.withOpacity(0.4)),
                                    ),
                                    child: Text(
                                      exp.status,
                                      style: GoogleFonts.rajdhani(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: color,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      exp.missionId,
                                      style: GoogleFonts.rajdhani(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Objective: ${exp.objective}',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: color,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined,
                                      size: 12, color: isDark ? AppTheme.textSecondary : Colors.black45),
                                  const SizedBox(width: 4),
                                  Text(
                                    exp.period,
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: isDark ? AppTheme.textSecondary : Colors.black45,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Icon(Icons.location_on_outlined,
                                      size: 12, color: isDark ? AppTheme.textSecondary : Colors.black45),
                                  const SizedBox(width: 4),
                                  Text(
                                    exp.location,
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: isDark ? AppTheme.textSecondary : Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: isDark ? AppTheme.textSecondary : Colors.black38,
                        ),
                      ],
                    ),

                    // Expanded highlights
                    if (isExpanded) ...[
                      const SizedBox(height: 16),
                      Container(
                        height: 1,
                        color: color.withOpacity(0.2),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Results:',
                        style: GoogleFonts.rajdhani(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...exp.results.map((r) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                r,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: isDark ? AppTheme.textSecondary : Colors.black54,
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )).toList().animate(interval: 60.ms).fadeIn().slideX(begin: -0.05, end: 0),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ).animate().fadeIn(delay: (idx * 150).ms).slideX(begin: 0.1, end: 0),
    );
  }

  Widget _buildBugBountyBanner(BuildContext context, bool isDark) {
    return GlowCard(
      glowColor: AppTheme.ironGold,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.ironGold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text('🏆', style: TextStyle(fontSize: 30)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BUG BOUNTY HUNTER',
                  style: GoogleFonts.rajdhani(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.ironGold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '30+ vulnerabilities reported across public programs — 2021 to present. Auth, session, crypto & business logic flaws responsibly disclosed.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDark ? AppTheme.textSecondary : Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1, end: 0);
  }
}
