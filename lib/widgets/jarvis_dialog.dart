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
          'I run 100% locally on his custom hardware architecture. How may I assist your reconnaissance today?',
    }
  ];

  final List<String> _quickPrompts = [
    'Who is Indian Stark?',
    'What are Gangadhar\'s security skills?',
    'Why was J.A.R.V.I.S. built on 8GB RAM?',
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

    if (q.contains('indian stark') || q.contains('who is gangadhar') || q.contains('who are you')) {
      return 'Gangadhar Poosarla—known across security circles as the "Indian Stark"—is an Application Security Analyst specializing in Web/API VAPT, mobile security, and automated DevSecOps tooling. He engineered me to break corporate reliance on cloud AI and master cybersecurity from first principles.';
    } else if (q.contains('skill') || q.contains('capabilities') || q.contains('stack')) {
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
    final dialogWidth = width > 700 ? 640.0 : width * 0.94;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: dialogWidth,
        height: 600,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF091322) : const Color(0xFFF0F6FF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.arcReactor.withOpacity(0.5), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: AppTheme.arcReactor.withOpacity(0.2),
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
                color: isDark ? const Color(0xFF050A14) : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                border: Border(
                  bottom: BorderSide(color: AppTheme.arcReactor.withOpacity(0.2)),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.arcReactor),
                      boxShadow: [
                        BoxShadow(color: AppTheme.arcReactor.withOpacity(0.5), blurRadius: 8),
                      ],
                    ),
                    child: const Center(
                      child: Text('◈', style: TextStyle(color: AppTheme.arcReactor, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'J.A.R.V.I.S. // TACTICAL CORE',
                        style: GoogleFonts.rajdhani(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.arcReactor,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        'LOCAL SILICON EDGE AI · CREATED BY INDIAN STARK',
                        style: GoogleFonts.rajdhani(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.ironGold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, size: 20),
                    color: AppTheme.textSecondary,
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
                            ? AppTheme.arcReactor.withOpacity(0.12)
                            : (isDark ? const Color(0xFF0D1B2A) : Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isUser
                              ? AppTheme.arcReactor.withOpacity(0.4)
                              : AppTheme.cyberGreen.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isUser ? '[ YOU ]' : '[ J.A.R.V.I.S. ]',
                            style: GoogleFonts.rajdhani(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: isUser ? AppTheme.arcReactor : AppTheme.cyberGreen,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            msg['text'] ?? '',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: isDark ? AppTheme.textPrimary : const Color(0xFF050A14),
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
                          color: AppTheme.arcReactor,
                        ),
                      ),
                      backgroundColor: AppTheme.arcReactor.withOpacity(0.08),
                      side: BorderSide(color: AppTheme.arcReactor.withOpacity(0.3)),
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
                color: isDark ? const Color(0xFF050A14) : Colors.white,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
                border: Border(
                  top: BorderSide(color: AppTheme.arcReactor.withOpacity(0.2)),
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
                        color: isDark ? AppTheme.textPrimary : const Color(0xFF050A14),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Ask J.A.R.V.I.S. anything about Gangadhar...',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppTheme.textSecondary.withOpacity(0.7),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        filled: true,
                        fillColor: isDark ? const Color(0xFF0D1B2A) : const Color(0xFFF0F6FF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppTheme.arcReactor.withOpacity(0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppTheme.arcReactor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send_rounded, color: AppTheme.arcReactor),
                    onPressed: () => _sendMessage(_controller.text),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    tooltip: 'View J.A.R.V.I.S. on GitHub',
                    icon: const Icon(Icons.code_rounded, color: AppTheme.ironGold),
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
