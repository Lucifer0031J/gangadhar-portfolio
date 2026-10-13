import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int? _hoveredIndex;
  int? _easterEggIndex;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isWide = MediaQuery.of(context).size.width > 700;

    return Container(
      color: isDark ? const Color(0xFF070E1A) : const Color(0xFFE8F0F8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(
            title: 'Security Arsenal',
            subtitle: 'Research & applied security weapons',
            accentColor: AppTheme.redAlert,
          ),
          const SizedBox(height: 40),
          isWide
              ? _buildGrid(context, isDark, 2)
              : _buildGrid(context, isDark, 1),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context, bool isDark, int cols) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            childAspectRatio: cols == 2 ? 1.05 : 0.95,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: ResumeData.projects.length,
          itemBuilder: (_, idx) {
            final project = ResumeData.projects[idx];
            return _buildProjectCard(context, isDark, idx, project);
          },
        );
      },
    );
  }

  Widget _buildProjectCard(BuildContext context, bool isDark, int idx, Project project) {
    final color = Color(project.color);
    final isHovered = _hoveredIndex == idx;
    final showEasterEgg = _easterEggIndex == idx;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = idx),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: GestureDetector(
        onLongPress: () {
          setState(() => _easterEggIndex = showEasterEgg ? null : idx);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkCard : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHovered ? color : color.withOpacity(0.2),
              width: isHovered ? 1.5 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? color.withOpacity(0.25)
                    : Colors.black.withOpacity(isDark ? 0.3 : 0.08),
                blurRadius: isHovered ? 24 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Top accent bar
                Positioned(
                  top: 0, left: 0, right: 0,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color.withOpacity(0.3), color, color.withOpacity(0.3)],
                      ),
                    ),
                  ),
                ),
                // Card content
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon + title
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(project.icon, style: const TextStyle(fontSize: 24)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              project.title,
                              style: GoogleFonts.rajdhani(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Description
                      Expanded(
                        child: Text(
                          project.description,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDark ? AppTheme.textSecondary : Colors.black54,
                            height: 1.6,
                          ),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Tags
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: project.tags.map((tag) => CyberTag(label: tag, color: color)).toList(),
                      ),

                      const SizedBox(height: 10),

                      // Long press hint
                      Row(
                        children: [
                          Icon(Icons.touch_app_rounded, size: 12,
                              color: isDark ? AppTheme.textSecondary.withOpacity(0.5) : Colors.black26),
                          const SizedBox(width: 4),
                          Text(
                            'Long press for Stark\'s take',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: isDark ? AppTheme.textSecondary.withOpacity(0.5) : Colors.black26,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Easter egg overlay
                if (showEasterEgg)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.darkBg.withOpacity(0.92),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('🦾', style: TextStyle(fontSize: 40)),
                          const SizedBox(height: 12),
                          Text(
                            project.starkComment,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rajdhani(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.ironGold,
                              fontStyle: FontStyle.italic,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '— Tony Stark, probably',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppTheme.ironGold.withOpacity(0.6),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => setState(() => _easterEggIndex = null),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppTheme.ironGold.withOpacity(0.4)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'DISMISS',
                                style: GoogleFonts.rajdhani(
                                  fontSize: 12,
                                  color: AppTheme.ironGold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(duration: 300.ms),
                  ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: (idx * 150).ms).scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1));
  }
}
