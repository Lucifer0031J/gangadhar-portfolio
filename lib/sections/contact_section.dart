import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../widgets/common_widgets.dart';

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
      setState(() => _showFinalEgg = true);
    }
  }

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
            title: 'Contact',
            subtitle: 'Open a channel',
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
        icon: '📧',
        label: 'EMAIL',
        value: ResumeData.email,
        color: AppTheme.arcReactor,
        copyable: true,
      ),
      _ContactItem(
        icon: '📱',
        label: 'PHONE',
        value: ResumeData.phone,
        color: AppTheme.cyberGreen,
        copyable: true,
      ),
      _ContactItem(
        icon: '💼',
        label: 'LINKEDIN',
        value: ResumeData.linkedin,
        color: Color(0xFF0A66C2),
        copyable: false,
      ),
      _ContactItem(
        icon: '📍',
        label: 'LOCATION',
        value: ResumeData.location,
        color: AppTheme.ironGold,
        copyable: false,
      ),
    ];

    return Column(
      children: contacts.asMap().entries.map((e) {
        final contact = e.value;
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
                    color: contact.color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(contact.icon, style: const TextStyle(fontSize: 20)),
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
                          color: contact.color,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        contact.value,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
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
                            ? contact.color.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: contact.color.withOpacity(0.3)),
                      ),
                      child: Text(
                        _copiedField == contact.label ? '✓ COPIED' : 'COPY',
                        style: GoogleFonts.rajdhani(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: contact.color,
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
                    color: AppTheme.cyberGreen.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Terminal lines
            ..._terminalLines(context, isDark),
            if (_showFinalEgg) ...[
              const SizedBox(height: 8),
              Text(
                '> "I am Iron Man." 🦾',
                style: GoogleFonts.sourceCodePro(
                  fontSize: 13,
                  color: AppTheme.ironGold,
                ),
              ).animate().fadeIn(duration: 600.ms),
            ],
          ],
        ),
      ),
    ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0);
  }

  List<Widget> _terminalLines(BuildContext context, bool isDark) {
    final lines = [
      ('$ ', 'whoami', AppTheme.cyberGreen, null),
      ('  ', 'Gangadhar Poosarla — AppSec Engineer', AppTheme.textSecondary, null),
      ('$ ', 'cat skills.txt | head -3', AppTheme.cyberGreen, null),
      ('  ', 'VAPT • Threat Modeling • Bug Bounty', AppTheme.textSecondary, null),
      ('$ ', 'curl -I career --status', AppTheme.cyberGreen, null),
      ('  ', 'HTTP/2 200 — OPEN TO OPPORTUNITIES', AppTheme.ironGold, null),
      ('$ ', 'ping gangadhar', AppTheme.cyberGreen, null),
      ('  ', 'gangadharpoosarla8@gmail.com', AppTheme.arcReactor, null),
      ('$ ', '█', AppTheme.cyberGreen, null),
    ];

    return lines.asMap().entries.map((e) {
      final l = e.value;
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          children: [
            Text(l.$1, style: GoogleFonts.sourceCodePro(fontSize: 13, color: l.$3)),
            Expanded(
              child: Text(
                l.$2,
                style: GoogleFonts.sourceCodePro(fontSize: 13, color: l.$3),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildFooter(BuildContext context, bool isDark) {
    return Column(
      children: [
        NeonDivider(color: AppTheme.arcReactor.withOpacity(0.3)),
        Text(
          'GANGADHAR POOSARLA',
          style: GoogleFonts.rajdhani(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Application Security Engineer • Bug Bounty Hunter • Researcher',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.arcReactor,
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
              color: AppTheme.cyberGreen.withOpacity(0.3 + _pulseCtrl.value * 0.3),
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '© 2026 Gangadhar Poosarla • Built with Flutter ❤️',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDark ? AppTheme.textSecondary.withOpacity(0.5) : Colors.black26,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _ContactItem {
  final String icon;
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
