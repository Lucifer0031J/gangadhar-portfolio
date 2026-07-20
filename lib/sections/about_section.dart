import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isWide = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(
            title: 'About Me',
            subtitle: 'The man behind the keyboard',
            accentColor: AppTheme.arcReactor,
          ),
          const SizedBox(height: 40),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildBio(context, isDark)),
                    const SizedBox(width: 32),
                    Expanded(flex: 2, child: _buildInfoCard(context, isDark)),
                  ],
                )
              : Column(
                  children: [
                    _buildBio(context, isDark),
                    const SizedBox(height: 24),
                    _buildInfoCard(context, isDark),
                  ],
                ),
          const SizedBox(height: 40),
          _buildStatsRow(context),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlowCard(
          glowColor: AppTheme.arcReactor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.arcReactor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.person_outline_rounded,
                        color: AppTheme.arcReactor, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'WHO AM I?',
                    style: GoogleFonts.rajdhani(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.arcReactor,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                ResumeData.summary,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isDark ? AppTheme.textSecondary : Colors.black54,
                  height: 1.8,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),

        const SizedBox(height: 16),

        // Personality card — Iron Man vibe
        GlowCard(
          glowColor: AppTheme.ironGold,
          child: Row(
            children: [
              const Text('🦾', style: TextStyle(fontSize: 32)),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BUILT DIFFERENT',
                      style: GoogleFonts.rajdhani(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.ironGold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Offensive mindset. Defensive expertise. The kind of engineer who builds the lock and tries to pick it — just to make sure it\'s unbreakable.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDark ? AppTheme.textSecondary : Colors.black54,
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.1, end: 0),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context, bool isDark) {
    return GlowCard(
      glowColor: AppTheme.cyberGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INTEL',
            style: GoogleFonts.rajdhani(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.cyberGreen,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 16),
          ..._infoRows(context, isDark),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1, end: 0);
  }

  List<Widget> _infoRows(BuildContext context, bool isDark) {
    final rows = [
      ('📧', 'Email', ResumeData.email),
      ('📱', 'Phone', ResumeData.phone),
      ('🔗', 'LinkedIn', ResumeData.linkedin),
      ('📍', 'Location', ResumeData.location),
      ('🏢', 'Current Role', 'AppSec Engineer @ Yalamanchili'),
      ('🎓', 'Education', 'B.Tech IT — GMRIT, 2024'),
      ('🎖️', 'Certification', 'CTIGA — Red Team Leaders'),
    ];

    return rows.map((r) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(r.$1, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  r.$2.toUpperCase(),
                  style: GoogleFonts.rajdhani(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.cyberGreen,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  r.$3,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )).toList();
  }

  Widget _buildStatsRow(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = constraints.maxWidth > 600 ? 4 : 2;
        return GridView.count(
          crossAxisCount: cols,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.3,
          children: const [
            StatCard(value: '40+', label: 'Web & API Apps\nSecured', color: AppTheme.arcReactor, icon: '🛡️'),
            StatCard(value: '92%', label: 'High/Critical\nClosure Rate', color: AppTheme.cyberGreen, icon: '✅'),
            StatCard(value: '30+', label: 'Bugs Reported\nvia Bounty', color: AppTheme.ironGold, icon: '🐛'),
            StatCard(value: '28%', label: 'Vuln Reopen\nRate Reduced', color: AppTheme.redAlert, icon: '📉'),
          ],
        );
      },
    ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1, end: 0);
  }
}
