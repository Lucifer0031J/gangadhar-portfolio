import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';
import '../utils/jarvis_voice.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with TickerProviderStateMixin {
  late AnimationController _pulseCtrl;
  String? _copiedField;
  int _easterEggTaps = 0;
  bool _showFinalEgg = false;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  void _copy(String value, String field) {
    Clipboard.setData(ClipboardData(text: value));
    setState(() => _copiedField = field);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copiedField = null);
    });
  }

  void _handleTerminalTap() {
    setState(() => _easterEggTaps++);
    if (_easterEggTaps >= 7) {
      if (!_showFinalEgg) {
        setState(() => _showFinalEgg = true);
        JarvisVoice.speak("Security clearance verified. I am Iron Man.");
      } else {
        JarvisVoice.speak("I am Iron Man.");
      }
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
          const SectionHeader(
            title: 'Mission Control',
            subtitle: 'Secure comms channel',
            accentColor: AppTheme.cyberGreen,
          ),
          const SizedBox(height: 40),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildContactCards(context, isDark)),
                    const SizedBox(width: 24),
                    Expanded(flex: 2, child: _buildTerminal(context, isDark)),
                  ],
                )
              : Column(
                  children: [
                    _buildContactCards(context, isDark),
                    const SizedBox(height: 24),
                    _buildTerminal(context, isDark),
                  ],
                ),
          const SizedBox(height: 40),
          _buildFooter(context, isDark),
        ],
      ),
    );
  }

  Widget _buildContactCards(BuildContext context, bool isDark) {
    final contacts = [
      _ContactItem(
        icon: Icons.wifi_rounded,
        label: 'SIGNAL',
        value: 'ONLINE',
        color: AppTheme.arcReactor,
        copyable: false,
      ),
      _ContactItem(
        icon: Icons.timer_rounded,
        label: 'RESPONSE TIME',
        value: '< 24 HOURS',
        color: AppTheme.cyberGreen,
        copyable: false,
      ),
      _ContactItem(
        icon: Icons.event_available_rounded,
        label: 'AVAILABILITY',
        value: 'OPEN TO APPSEC ROLES',
        color: AppTheme.ironGold,
        copyable: false,
      ),
      _ContactItem(
        icon: Icons.email_rounded,
        label: 'ENCRYPTED COMMS',
        value: ResumeData.email,
        color: AppTheme.redAlert,
        copyable: true,
      ),
    ];

    return Column(
      children: contacts.asMap().entries.map((e) {
        final contact = e.value;
        final effectiveColor = isDark
            ? contact.color
            : (contact.color == AppTheme.arcReactor
                ? AppTheme.arcReactorLight
                : (contact.color == AppTheme.ironGold
                    ? AppTheme.ironGoldLight
                    : (contact.color == AppTheme.cyberGreen
                        ? AppTheme.cyberGreenLight
                        : (contact.color == AppTheme.redAlert ? AppTheme.redAlertLight : contact.color))));

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GlowCard(
            glowColor: contact.color,
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: effectiveColor.withOpacity(isDark ? 0.12 : 0.08),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: effectiveColor.withOpacity(isDark ? 0.25 : 0.4)),
                  ),
                  child: Center(
                    child: Icon(contact.icon, size: 20, color: effectiveColor),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.label,
                        style: GoogleFonts.rajdhani(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: effectiveColor,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        contact.value,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isDark ? AppTheme.textPrimary : AppTheme.textPrimaryLight,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                if (contact.copyable)
                  GestureDetector(
                    onTap: () => _copy(contact.value, contact.label),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: _copiedField == contact.label
                            ? effectiveColor.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: effectiveColor.withOpacity(0.4)),
                      ),
                      child: Text(
                        _copiedField == contact.label ? '✓ COPIED' : 'COPY',
                        style: GoogleFonts.rajdhani(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: effectiveColor,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ).animate().fadeIn(delay: (e.key * 100).ms).slideX(begin: -0.1, end: 0),
        );
      }).toList(),
    );
  }

  Widget _buildTerminal(BuildContext context, bool isDark) {
    final termGreen = isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight;
    final termGold = isDark ? AppTheme.ironGold : AppTheme.ironGoldLight;
    final termCyan = isDark ? AppTheme.arcReactor : AppTheme.arcReactorLight;

    return GestureDetector(
      onTap: _handleTerminalTap,
      child: GlowCard(
        glowColor: AppTheme.cyberGreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Terminal header
            Row(
              children: [
                Container(
                  width: 10, height: 10,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFF5F57)),
                ),
                Container(
                  width: 10, height: 10,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFFBD2E)),
                ),
                Container(
                  width: 10, height: 10,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF28C841)),
                ),
                Text(
                  'gangadhar@sec-shell ~ %',
                  style: GoogleFonts.sourceCodePro(
                    fontSize: 11,
                    color: termGreen.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Terminal lines
            ..._terminalLines(context, isDark),
            if (_showFinalEgg) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: termGold.withOpacity(isDark ? 0.12 : 0.08),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: termGold.withOpacity(0.4)),
                  boxShadow: [
                    BoxShadow(
                      color: termGold.withOpacity(isDark ? 0.2 : 0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '> "I am Iron Man." 🦾',
                        style: GoogleFonts.sourceCodePro(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: termGold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => JarvisVoice.speak("I am Iron Man."),
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: termCyan.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: termCyan.withOpacity(0.4)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.volume_up_rounded, size: 12, color: termCyan),
                            const SizedBox(width: 4),
                            Text(
                              'J.A.R.V.I.S.',
                              style: GoogleFonts.rajdhani(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: termCyan,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 600.ms),
            ],
          ],
        ),
      ),
    ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0);
  }

  List<Widget> _terminalLines(BuildContext context, bool isDark) {
    final termGreen = isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight;
    final termGold = isDark ? AppTheme.ironGold : AppTheme.ironGoldLight;
    final termCyan = isDark ? AppTheme.arcReactor : AppTheme.arcReactorLight;
    final termText = isDark ? AppTheme.textSecondary : AppTheme.textSecondaryLight;

    final lines = [
      ('\$ ', 'whoami', termGreen, null),
      ('  ', 'Gangadhar Poosarla — AppSec Engineer', termText, null),
      ('\$ ', 'cat skills.txt | head -3', termGreen, null),
      ('  ', 'VAPT • Threat Modeling • Bug Bounty', termText, null),
      ('\$ ', 'curl -I career --status', termGreen, null),
      ('  ', 'HTTP/2 200 — OPEN TO OPPORTUNITIES', termGold, null),
      ('\$ ', 'ping gangadhar', termGreen, null),
      ('  ', 'gangadharpoosarla8@gmail.com', termCyan, null),
      ('\$ ', '█', termGreen, null),
    ];

    return lines.asMap().entries.map((e) {
      final l = e.value;
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          children: [
            Text(l.$1, style: GoogleFonts.sourceCodePro(fontSize: 13, color: l.$3, fontWeight: FontWeight.w600)),
            Expanded(
              child: Text(
                l.$2,
                style: GoogleFonts.sourceCodePro(fontSize: 13, color: l.$3, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildFooter(BuildContext context, bool isDark) {
    final cyan = isDark ? AppTheme.arcReactor : AppTheme.arcReactorLight;
    final green = isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight;

    return Column(
      children: [
        NeonDivider(color: cyan.withOpacity(0.3)),
        Text(
          'GANGADHAR POOSARLA',
          style: GoogleFonts.rajdhani(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: isDark ? AppTheme.textPrimary : AppTheme.textPrimaryLight,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Application Security Engineer • Bug Bounty Hunter • Researcher',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: cyan,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        AnimatedBuilder(
          animation: _pulseCtrl,
          builder: (_, __) => Text(
            '[ TAP TERMINAL 7× FOR A HIDDEN MESSAGE ]',
            style: GoogleFonts.rajdhani(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: green.withOpacity(0.4 + _pulseCtrl.value * 0.4),
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '© 2026 Gangadhar Poosarla • Built with Flutter ❤️',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDark ? AppTheme.textSecondary.withOpacity(0.5) : AppTheme.textSecondaryLight.withOpacity(0.7),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _ContactItem {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final bool copyable;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.copyable,
  });
}
