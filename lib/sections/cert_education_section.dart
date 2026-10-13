import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';
import '../utils/jarvis_voice.dart';

class CertEducationSection extends StatefulWidget {
  const CertEducationSection({super.key});

  @override
  State<CertEducationSection> createState() => _CertEducationSectionState();
}

class _CertEducationSectionState extends State<CertEducationSection> {
  int _copyrightTaps = 0;
  bool _showCopyrightEgg = false;

  void _triggerCopyrightEasterEgg() {
    setState(() => _copyrightTaps++);
    if (_copyrightTaps >= 3) {
      setState(() => _showCopyrightEgg = true);
      JarvisVoice.speak(
          "Intellectual property verified. Government of India copyright registration L-139347/2023. Decentralized DNS security architecture on record, sir.");
      Future.delayed(const Duration(seconds: 7), () {
        if (mounted) setState(() => _showCopyrightEgg = false);
      });
      _copyrightTaps = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isWide = MediaQuery.of(context).size.width > 700;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          const SectionHeader(
            title: 'Credentials',
            subtitle: 'Certified & educated',
            accentColor: AppTheme.ironGold,
          ),
          const SizedBox(height: 40),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildCertifications(context, isDark)),
                    const SizedBox(width: 24),
                    Expanded(child: _buildEducation(context, isDark)),
                  ],
                )
              : Column(
                  children: [
                    _buildCertifications(context, isDark),
                    const SizedBox(height: 24),
                    _buildEducation(context, isDark),
                  ],
                ),
          const SizedBox(height: 40),
          _buildCopyrightBadge(context, isDark),
        ],
      ),
    );
  }

  Widget _buildCertifications(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CERTIFICATIONS',
          style: GoogleFonts.rajdhani(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: isDark ? AppTheme.textSecondary : Colors.black45,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 16),
        ...ResumeData.certifications.asMap().entries.map((e) {
          final cert = e.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GlowCard(
              glowColor: AppTheme.ironGold,
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.ironGold.withOpacity(0.3), AppTheme.ironGold.withOpacity(0.1)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ironGold.withOpacity(0.3)),
                    ),
                    child: Center(
                      child: Text(cert.icon, style: const TextStyle(fontSize: 26)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.ironGold.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppTheme.ironGold.withOpacity(0.3)),
                          ),
                          child: Text(
                            cert.acronym,
                            style: GoogleFonts.rajdhani(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.ironGold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          cert.name,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${cert.issuer} • ${cert.date}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark ? AppTheme.textSecondary : Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(delay: (e.key * 150).ms).slideX(begin: -0.1, end: 0);
        }).toList(),
      ],
    );
  }

  Widget _buildEducation(BuildContext context, bool isDark) {
    const edu = ResumeData.education;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACADEMIC BACKGROUND',
          style: GoogleFonts.rajdhani(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: isDark ? AppTheme.textSecondary : Colors.black45,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 16),
        GlowCard(
          glowColor: AppTheme.arcReactor,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.arcReactor.withOpacity(0.3), AppTheme.arcReactor.withOpacity(0.1)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.arcReactor.withOpacity(0.3)),
                    ),
                    child: Center(
                      child: Text(edu.icon, style: const TextStyle(fontSize: 26)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          edu.degree,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                            fontWeight: FontWeight.w600,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          edu.institution,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppTheme.arcReactor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          edu.period,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark ? AppTheme.textSecondary : Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.arcReactor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.arcReactor.withOpacity(0.2)),
                ),
                child: Text(
                  '"The best engineers are the ones who never stop learning — I graduated, then kept going."',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rajdhani(
                    fontSize: 13,
                    color: AppTheme.arcReactor.withOpacity(0.8),
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1, end: 0),
      ],
    );
  }

  Widget _buildCopyrightBadge(BuildContext context, bool isDark) {
    return GestureDetector(
      onTap: _triggerCopyrightEasterEgg,
      child: GlowCard(
        glowColor: AppTheme.cyberGreen,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('⛓️', style: TextStyle(fontSize: 24)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'COPYRIGHT HOLDER',
                            style: GoogleFonts.rajdhani(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.cyberGreen,
                              letterSpacing: 2,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '[ TAP 3× ]',
                            style: GoogleFonts.rajdhani(
                              fontSize: 9,
                              color: AppTheme.cyberGreen.withOpacity(0.6),
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Decentralized DNS for Spoofing Mitigation (Ethereum) — L-139347/2023',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: isDark ? AppTheme.textSecondary : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_showCopyrightEgg) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.darkBg.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppTheme.cyberGreen.withOpacity(0.5)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.record_voice_over_rounded, size: 14, color: AppTheme.cyberGreen),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'J.A.R.V.I.S.: Government of India Copyright L-139347/2023 Verified.',
                        style: GoogleFonts.rajdhani(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.cyberGreen,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => JarvisVoice.speak(
                          "Intellectual property verified. Government of India copyright registration L-139347/2023. Decentralized DNS security architecture on record, sir."),
                      child: const Icon(Icons.volume_up_rounded, size: 14, color: AppTheme.cyberGreen),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 250.ms),
            ],
          ],
        ),
      ),
    ).animate().fadeIn(delay: 600.ms);
  }
}
