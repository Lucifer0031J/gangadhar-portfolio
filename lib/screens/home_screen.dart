import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/experience_section.dart';
import '../sections/projects_section.dart';
import '../sections/cert_education_section.dart';
import '../sections/contact_section.dart';
import '../sections/research_section.dart';
import '../widgets/common_widgets.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode themeMode;

  const HomeScreen({
    super.key,
    required this.onThemeToggle,
    required this.themeMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  int _currentSection = 0;
  bool _showFab = false;
  bool _navVisible = true;
  late AnimationController _navAnim;

  // Section keys for scrolling
  final List<GlobalKey> _sectionKeys = List.generate(8, (_) => GlobalKey());

  final _navItems = [
    ('Home', Icons.home_outlined),
    ('About', Icons.person_outline),
    ('Capabilities', Icons.bolt_outlined),
    ('Research', Icons.biotech_outlined),
    ('Mission Logs', Icons.work_outline),
    ('Arsenal', Icons.science_outlined),
    ('Credentials', Icons.verified_outlined),
    ('Comms', Icons.mail_outline),
  ];

  @override
  void initState() {
    super.initState();
    _navAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Show/hide FAB
    setState(() => _showFab = _scrollController.offset > 300);

    // Determine current section
    for (int i = _sectionKeys.length - 1; i >= 0; i--) {
      final ctx = _sectionKeys[i].currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox?;
        if (box != null) {
          final pos = box.localToGlobal(Offset.zero);
          if (pos.dy <= MediaQuery.of(context).size.height * 0.4) {
            if (_currentSection != i) setState(() => _currentSection = i);
            break;
          }
        }
      }
    }
  }

  void _scrollToSection(int index) {
    final ctx = _sectionKeys[index].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _navAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeMode == ThemeMode.dark;
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 900;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBg : AppTheme.lightBg,
      // ─── App Bar ─────────────────────────────────────────────────────────
      appBar: isWide ? _buildDesktopAppBar(isDark) : null,
      // ─── Bottom Nav (mobile) ─────────────────────────────────────────────
      bottomNavigationBar: !isWide ? _buildMobileBottomNav(isDark) : null,
      // ─── Side Drawer (tablet) ────────────────────────────────────────────
      drawer: !isWide ? _buildDrawer(isDark) : null,
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Add top padding on mobile for menu button
                if (!isWide) const SizedBox(height: 60),

                KeyedSubtree(key: _sectionKeys[0], child: const HeroSection()),
                const NeonDivider(),
                KeyedSubtree(key: _sectionKeys[1], child: const AboutSection()),
                const NeonDivider(),
                KeyedSubtree(key: _sectionKeys[2], child: const SkillsSection()),
                const NeonDivider(),
                KeyedSubtree(key: _sectionKeys[3], child: const ResearchSection()),
                const NeonDivider(),
                KeyedSubtree(key: _sectionKeys[4], child: const ExperienceSection()),
                const NeonDivider(),
                KeyedSubtree(key: _sectionKeys[5], child: const ProjectsSection()),
                const NeonDivider(),
                KeyedSubtree(key: _sectionKeys[6], child: const CertEducationSection()),
                const NeonDivider(),
                KeyedSubtree(key: _sectionKeys[7], child: const ContactSection()),
              ],
            ),
          ),
          // Mobile top bar
          if (!isWide) _buildMobileTopBar(isDark),
        ],
      ),
      // ─── FAB — back to top ───────────────────────────────────────────────
      floatingActionButton: AnimatedOpacity(
        opacity: _showFab ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton(
          onPressed: _scrollToTop,
          backgroundColor: AppTheme.arcReactor,
          foregroundColor: AppTheme.darkBg,
          mini: true,
          shape: const CircleBorder(),
          child: const Icon(Icons.keyboard_arrow_up_rounded),
        ),
      ),
    );
  }

  // ─── Desktop App Bar ───────────────────────────────────────────────────────
  PreferredSizeWidget _buildDesktopAppBar(bool isDark) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: Container(
        decoration: BoxDecoration(
          color: (isDark ? AppTheme.darkBg : AppTheme.lightBg).withOpacity(0.92),
          border: Border(
            bottom: BorderSide(
              color: AppTheme.arcReactor.withOpacity(0.15),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.06),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                // Logo
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppTheme.arcReactor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.arcReactor.withOpacity(0.4)),
                      ),
                      child: Center(
                        child: Text(
                          'GP',
                          style: GoogleFonts.rajdhani(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.arcReactor,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'GANGADHAR',
                      style: GoogleFonts.rajdhani(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Nav items
                ..._navItems.asMap().entries.map((e) {
                  final selected = e.key == _currentSection;
                  return GestureDetector(
                    onTap: () => _scrollToSection(e.key),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppTheme.arcReactor.withOpacity(0.12)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: selected
                              ? AppTheme.arcReactor.withOpacity(0.4)
                              : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        e.value.$1,
                        style: GoogleFonts.rajdhani(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: selected
                              ? AppTheme.arcReactor
                              : (isDark ? AppTheme.textSecondary : Colors.black45),
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(width: 12),
                // Theme toggle
                _buildThemeToggle(isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ─── Mobile Top Bar ────────────────────────────────────────────────────────
  Widget _buildMobileTopBar(bool isDark) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: (isDark ? AppTheme.darkBg : AppTheme.lightBg).withOpacity(0.95),
          border: Border(
            bottom: BorderSide(color: AppTheme.arcReactor.withOpacity(0.15)),
          ),
        ),
        child: Row(
          children: [
            Builder(
              builder: (ctx) => GestureDetector(
                onTap: () => Scaffold.of(ctx).openDrawer(),
                child: Icon(
                  Icons.menu_rounded,
                  color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'GP / PORTFOLIO',
              style: GoogleFonts.rajdhani(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppTheme.arcReactor,
                letterSpacing: 3,
              ),
            ),
            const Spacer(),
            _buildThemeToggle(isDark),
          ],
        ),
      ),
    );
  }

  // ─── Bottom Nav (mobile) ───────────────────────────────────────────────────
  Widget _buildMobileBottomNav(bool isDark) {
    final visibleItems = _navItems.sublist(0, 5); // Show 5 on bottom nav
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        border: Border(
          top: BorderSide(color: AppTheme.arcReactor.withOpacity(0.15)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.4 : 0.1),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: visibleItems.asMap().entries.map((e) {
              final selected = e.key == _currentSection;
              return GestureDetector(
                onTap: () => _scrollToSection(e.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected ? AppTheme.arcReactor.withOpacity(0.1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        e.value.$2,
                        size: 20,
                        color: selected
                            ? AppTheme.arcReactor
                            : (isDark ? AppTheme.textSecondary : Colors.black38),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        e.value.$1,
                        style: GoogleFonts.rajdhani(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: selected
                              ? AppTheme.arcReactor
                              : (isDark ? AppTheme.textSecondary : Colors.black38),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  // ─── Side Drawer ───────────────────────────────────────────────────────────
  Widget _buildDrawer(bool isDark) {
    return Drawer(
      backgroundColor: isDark ? AppTheme.darkSurface : Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.arcReactor.withOpacity(0.1),
                      border: Border.all(color: AppTheme.arcReactor.withOpacity(0.4), width: 2),
                    ),
                    child: Center(
                      child: Text(
                        'GP',
                        style: GoogleFonts.rajdhani(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.arcReactor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'GANGADHAR\nPOOSARLA',
                    style: GoogleFonts.rajdhani(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A),
                      height: 1.1,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    'AppSec Engineer',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppTheme.arcReactor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: AppTheme.arcReactor.withOpacity(0.15)),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                children: _navItems.asMap().entries.map((e) {
                  final selected = e.key == _currentSection;
                  return ListTile(
                    leading: Icon(
                      e.value.$2,
                      color: selected ? AppTheme.arcReactor : (isDark ? AppTheme.textSecondary : Colors.black38),
                      size: 20,
                    ),
                    title: Text(
                      e.value.$1,
                      style: GoogleFonts.rajdhani(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: selected ? AppTheme.arcReactor : (isDark ? AppTheme.textPrimary : const Color(0xFF0D1B2A)),
                        letterSpacing: 1,
                      ),
                    ),
                    selected: selected,
                    selectedTileColor: AppTheme.arcReactor.withOpacity(0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(e.key);
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildThemeToggle(isDark),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Theme Toggle ──────────────────────────────────────────────────────────
  Widget _buildThemeToggle(bool isDark) {
    return GestureDetector(
      onTap: widget.onThemeToggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isDark
              ? AppTheme.ironGold.withOpacity(0.1)
              : AppTheme.arcReactor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark
                ? AppTheme.ironGold.withOpacity(0.3)
                : AppTheme.arcReactor.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isDark ? '☀️' : '🌙',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 4),
            Text(
              isDark ? 'LIGHT' : 'DARK',
              style: GoogleFonts.rajdhani(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: isDark ? AppTheme.ironGold : AppTheme.arcReactor,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
