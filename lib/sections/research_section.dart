import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';

class ResearchSection extends StatelessWidget {
  const ResearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isWide = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(
            title: 'Research Lab',
            subtitle: 'Current experiments & classified projects',
            accentColor: AppTheme.ironGold,
          ),
          const SizedBox(height: 40),
          isWide
              ? _buildGrid(context, isDark, 3)
              : _buildGrid(context, isDark, 1),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context, bool isDark, int cols) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cols,
        childAspectRatio: cols == 3 ? 1.5 : 3.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: ResumeData.research.length,
      itemBuilder: (_, idx) {
        final item = ResumeData.research[idx];
        return GlowCard(
          glowColor: AppTheme.ironGold,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.ironGold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppTheme.ironGold.withOpacity(0.4)),
                ),
                child: Text(
                  'STATUS: ${item.status}',
                  style: GoogleFonts.rajdhani(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.ironGold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                item.title,
                style: GoogleFonts.rajdhani(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: (idx * 100).ms).slideY(begin: 0.1, end: 0);
      },
    );
  }
}
