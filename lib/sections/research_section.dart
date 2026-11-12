import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';
import '../utils/jarvis_voice.dart';

class ResearchSection extends StatefulWidget {
  const ResearchSection({super.key});

  @override
  State<ResearchSection> createState() => _ResearchSectionState();
}

class _ResearchSectionState extends State<ResearchSection> {
  int? _activeEasterEggIdx;

  void _triggerResearchEasterEgg(int idx, String title) {
    if (_activeEasterEggIdx == idx) {
      JarvisVoice.stop();
      setState(() => _activeEasterEggIdx = null);
    } else {
      setState(() => _activeEasterEggIdx = idx);
      JarvisVoice.speak(
          "Accessing classified Stark Archives for $title. Quantum-resistant cryptography and decentralized protocols verified. Clearance level seven approved.");
    }
  }

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
    final gold = isDark ? AppTheme.ironGold : AppTheme.ironGoldLight;
    final cyan = isDark ? AppTheme.arcReactor : AppTheme.arcReactorLight;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cols,
        childAspectRatio: cols == 3 ? 1.4 : 2.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: ResumeData.research.length,
      itemBuilder: (_, idx) {
        final item = ResumeData.research[idx];
        final isEggActive = _activeEasterEggIdx == idx;

        return GestureDetector(
          onTap: () => _triggerResearchEasterEgg(idx, item.title),
          child: GlowCard(
            glowColor: isEggActive ? AppTheme.arcReactor : AppTheme.ironGold,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: gold.withOpacity(isDark ? 0.15 : 0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: gold.withOpacity(isDark ? 0.4 : 0.5)),
                      ),
                      child: Text(
                        'STATUS: ${item.status}',
                        style: GoogleFonts.rajdhani(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: gold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '[ TAP FOR INTEL ]',
                      style: GoogleFonts.rajdhani(
                        fontSize: 9,
                        color: cyan.withOpacity(0.7),
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  item.title,
                  style: GoogleFonts.rajdhani(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDark ? AppTheme.textPrimary : AppTheme.textPrimaryLight,
                  ),
                ),
                if (isEggActive) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: cyan.withOpacity(isDark ? 0.12 : 0.08),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: cyan.withOpacity(0.4)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.record_voice_over_rounded, size: 12, color: cyan),
                        const SizedBox(width: 4),
                        Text(
                          'J.A.R.V.I.S.: Level 7 Classified Clearance',
                          style: GoogleFonts.rajdhani(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: cyan,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: 200.ms),
                ],
              ],
            ),
          ),
        ).animate().fadeIn(delay: (idx * 100).ms).slideY(begin: 0.1, end: 0);
      },
    );
  }
}
