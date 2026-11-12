import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/resume_data.dart';
import '../utils/jarvis_voice.dart';

class JarvisDialog extends StatefulWidget {
  const JarvisDialog({super.key});

  @override
  State<JarvisDialog> createState() => _JarvisDialogState();
}

class _JarvisDialogState extends State<JarvisDialog> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> _messages = [
    {
      'role': 'jarvis',
      'text':
          'Greetings, sir. I am J.A.R.V.I.S., Gangadhar\'s tactical AI wingman. '
          'I operate via an autonomous on-device ReAct agent engine on his private hardware architecture. How may I assist your reconnaissance today?',
    }
  ];

  final List<String> _quickPrompts = [
    'How does your autonomous agent engine work?',
    'What AppSec tools can you execute?',
    'Why run on-device instead of cloud LLMs?',
    'Who is Indian Stark?',
    'Tell me about his VAPT experience',
  ];

  @override
  void dispose() {
    JarvisVoice.stop();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    final query = text.trim();
    _controller.clear();
    final reply = _generateResponse(query);

    setState(() {
      _messages.add({'role': 'user', 'text': query});
      _messages.add({'role': 'jarvis', 'text': reply});
    });

    // Check if query is an explicit Stark Easter egg phrase in chat
    final q = query.toLowerCase();
    if (q.contains('i am iron man') || q.contains('indian stark')) {
      JarvisVoice.speak(reply);
    }

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _generateResponse(String query) {
    final q = query.toLowerCase();

    if (q.contains('agent') || q.contains('engine') || q.contains('react') || q.contains('how do you work')) {
      return 'I am powered by an on-device ReAct (Reasoning & Action) agent architecture engineered by Gangadhar. Rather than a static chatbot, I execute multi-turn thought loops, dynamically invoke tactical ToolSpecs (like security header audits and network recon), and verify findings locally on his 8GB RAM architecture!';
    } else if (q.contains('tool') || q.contains('capabilities') || q.contains('audit') || q.contains('execute')) {
      return 'My tactical tool suite includes automated HTTP Security Header Auditors (checking HSTS, CSP, X-Frame-Options), VirtualHost and DNS Route Verifiers, Real-time Host Telemetry, and offline OWASP / CVE Intelligence modules—all executable on-device.';
    } else if (q.contains('cloud') || q.contains('privacy') || q.contains('leak') || q.contains('on-device')) {
      return 'Enterprises face severe data leakage risks when feeding proprietary source code or VAPT findings to cloud LLMs. Gangadhar built me to run 100% locally on an NVIDIA GTX 1650 (4GB VRAM) and 8GB RAM, proving that air-gapped, zero-leakage AI security research is fully achievable on consumer silicon!';
    } else if (q.contains('indian stark') || q.contains('who is gangadhar') || q.contains('who are you')) {
      return 'Gangadhar Poosarla—known across security circles as the "Indian Stark"—is an Application Security Analyst specializing in Web/API VAPT, mobile security, and automated DevSecOps tooling. He engineered me to break corporate reliance on cloud AI and master cybersecurity from first principles.';
    } else if (q.contains('skill') || q.contains('stack')) {
      return 'Gangadhar\'s core arsenal includes Web & API VAPT (OWASP Top 10, ASVS, PCI-DSS), Mobile Security (MobSF, Frida), Secure Code Reviews (Java/Python), SAST/SCA automation (SonarQube, CycloneDX SBOM), and custom Python security tooling.';
    } else if (q.contains('hardware') || q.contains('8gb') || q.contains('ram') || q.contains('gtx')) {
      return 'I was architected to prove that cutting-edge AI security research doesn\'t require a 24GB datacenter GPU. I run locally on an NVIDIA GTX 1650 (4GB VRAM) and 8GB RAM using quantized Ollama inference and Edge Neural TTS with sub-second response times!';
    } else if (q.contains('vapt') || q.contains('experience') || q.contains('yalamanchili') || q.contains('work')) {
      return 'At Yalamanchili Solutions for Payments, Gangadhar conducted VAPT across 40+ web & API applications, engineered an automated DevSecOps SCA & Supply Chain Pipeline, and developed custom Apache & HTTP Header audit engines saving 15+ manual hours weekly.';
    } else if (q.contains('contact') || q.contains('hire') || q.contains('reach')) {
      return 'You can contact Gangadhar directly via email at ${ResumeData.email} or connect on LinkedIn at ${ResumeData.linkedin}. He is currently open to high-impact AppSec opportunities!';
    } else {
      return 'Understood. Gangadhar is a specialist in breaking insecure applications and engineering automated DevSecOps defenses. You can inspect his full security arsenal in the Projects section or explore my local source code on GitHub!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final dialogWidth = width > 700 ? 660.0 : width * 0.94;
    final primaryAccent = isDark ? AppTheme.arcReactor : AppTheme.arcReactorLight;
    final goldAccent = isDark ? AppTheme.ironGold : AppTheme.ironGoldLight;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: dialogWidth,
        height: 620,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF091322) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? primaryAccent.withOpacity(0.5) : primaryAccent.withOpacity(0.6),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: primaryAccent.withOpacity(isDark ? 0.2 : 0.15),
              blurRadius: 30,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF050A14) : const Color(0xFFF8FAFC),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                border: Border(
                  bottom: BorderSide(color: primaryAccent.withOpacity(0.2)),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryAccent, width: 1.5),
                      boxShadow: [
                        BoxShadow(color: primaryAccent.withOpacity(0.5), blurRadius: 8),
                      ],
                    ),
                    child: Center(
                      child: Text('◈', style: TextStyle(color: primaryAccent, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'J.A.R.V.I.S. // TACTICAL CORE',
                            style: GoogleFonts.rajdhani(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: primaryAccent,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: goldAccent.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: goldAccent.withOpacity(0.4)),
                            ),
                            child: Text(
                              'AUTONOMOUS AGENT',
                              style: GoogleFonts.rajdhani(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                color: goldAccent,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'AIR-GAPPED REACTION-LOOP AGENT · CREATED BY INDIAN STARK',
                        style: GoogleFonts.rajdhani(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: goldAccent,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, size: 20),
                    color: isDark ? AppTheme.textSecondary : AppTheme.textSecondaryLight,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Messages Log
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isUser = msg['role'] == 'user';

                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      constraints: BoxConstraints(maxWidth: dialogWidth * 0.82),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: isUser
                            ? primaryAccent.withOpacity(isDark ? 0.15 : 0.1)
                            : (isDark ? const Color(0xFF0D1B2A) : const Color(0xFFF1F5F9)),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isUser
                              ? primaryAccent.withOpacity(0.4)
                              : (isDark ? AppTheme.cyberGreen.withOpacity(0.3) : const Color(0xFFCBD5E1)),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isUser ? '[ YOU ]' : '[ J.A.R.V.I.S. AGENT ]',
                            style: GoogleFonts.rajdhani(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: isUser
                                  ? primaryAccent
                                  : (isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight),
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            msg['text'] ?? '',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: isDark ? AppTheme.textPrimary : AppTheme.textPrimaryLight,
                              height: 1.45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Quick Prompts
            Container(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _quickPrompts.map((prompt) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ActionChip(
                      label: Text(
                        prompt,
                        style: GoogleFonts.rajdhani(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: primaryAccent,
                        ),
                      ),
                      backgroundColor: primaryAccent.withOpacity(0.08),
                      side: BorderSide(color: primaryAccent.withOpacity(0.3)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onPressed: () => _sendMessage(prompt),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 8),

            // Input Bar & GitHub CTA
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF050A14) : const Color(0xFFF8FAFC),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
                border: Border(
                  top: BorderSide(color: primaryAccent.withOpacity(0.2)),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: _sendMessage,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: isDark ? AppTheme.textPrimary : AppTheme.textPrimaryLight,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Ask J.A.R.V.I.S. about Gangadhar\'s autonomous agent & skills...',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 12,
                          color: isDark ? AppTheme.textSecondary.withOpacity(0.7) : AppTheme.textSecondaryLight.withOpacity(0.7),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        filled: true,
                        fillColor: isDark ? const Color(0xFF0D1B2A) : Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: primaryAccent.withOpacity(0.3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: primaryAccent, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.send_rounded, color: primaryAccent),
                    onPressed: () => _sendMessage(_controller.text),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    tooltip: 'View J.A.R.V.I.S. on GitHub',
                    icon: Icon(Icons.code_rounded, color: goldAccent),
                    onPressed: () async {
                      final uri = Uri.parse(ResumeData.jarvisRepo);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
