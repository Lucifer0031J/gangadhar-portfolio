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
    'When did Gangadhar finish his studies?',
    'What certifications does he hold?',
    'Tell me about his VAPT experience',
    'How does your autonomous agent engine work?',
    'What AppSec tools can you execute?',
    'Tell me about his bug bounty achievements',
    'Why run on-device instead of cloud LLMs?',
    'Who is Indian Stark?',
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

  String _generateResponse(String rawQuery) {
    final q = rawQuery.toLowerCase().trim();

    // ─── 1. Education / Studies / Graduation ──────────────────────────────────
    if (q.contains('stud') ||
        q.contains('graduat') ||
        q.contains('college') ||
        q.contains('school') ||
        q.contains('degree') ||
        q.contains('btech') ||
        q.contains('b.tech') ||
        q.contains('gmrit') ||
        q.contains('education') ||
        q.contains('passout') ||
        q.contains('pass out') ||
        q.contains('academ') ||
        q.contains('qualification') ||
        q.contains('university')) {
      return 'Gangadhar completed his B.Tech in Information Technology from GMR Institute of Technology (GMRIT) in June 2024. Immediately after graduating, he began his professional career as an Application Security Analyst at Yalamanchili Solutions for Payments.';
    }

    // ─── 2. Certifications & Accreditations ─────────────────────────────────
    if (q.contains('certif') ||
        q.contains('credential') ||
        q.contains('license') ||
        q.contains('ctiga') ||
        q.contains('red team')) {
      return 'Gangadhar holds the CTIGA (Certified Threat Intelligence & Governance Analyst) certification issued by Red Team Leaders (Jan 2026). This credential validates his expertise in enterprise threat modeling, intelligence-led governance, and offensive/defensive AppSec architecture.';
    }

    // ─── 3. Current Employment & Work Experience ─────────────────────────────
    if (q.contains('current role') ||
        q.contains('current job') ||
        q.contains('current company') ||
        q.contains('where does he work') ||
        q.contains('where is he work') ||
        q.contains('yalamanchili') ||
        q.contains('present company') ||
        q.contains('employer') ||
        q.contains('wisenet') ||
        q.contains('job') ||
        q.contains('company') ||
        q.contains('work experience') ||
        q.contains('years of experience') ||
        q.contains('how much experience') ||
        q.contains('how many years')) {
      return 'Gangadhar has 1.9 years of practical Application Security experience. Currently, he works as an Application Security Analyst at Yalamanchili Solutions for Payments in Visakhapatnam, India (July 2024 – Present). There, he conducts VAPT across 40+ web & API banking applications, automates DevSecOps SCA/SBOM pipelines with CycloneDX & Nexus APIs, and built multi-threaded HTTP header auditors saving 15+ manual hours weekly. Previously, he interned at WiSeNet Automation (Nov 2023 – Jan 2024).';
    }

    // ─── 4. Bug Bounty & Vulnerability Disclosure ────────────────────────────
    if (q.contains('bounty') ||
        q.contains('bug') ||
        q.contains('hall of fame') ||
        q.contains('how many vulns') ||
        q.contains('how many bugs') ||
        q.contains('disclos')) {
      return 'Gangadhar is an accomplished bug bounty hunter with 30+ vulnerabilities reported across public programs and enterprise targets (2021 to present). His findings include authentication bypasses, session hijacking, IDORs, SSRFs, and business logic flaws across college portals, FacePrep, and SVR Travels.';
    }

    // ─── 5. Copyright & Intellectual Property ────────────────────────────────
    if (q.contains('copyright') ||
        q.contains('patent') ||
        q.contains('intellectual property') ||
        q.contains('l-139347') ||
        q.contains('government of india')) {
      return 'Gangadhar is the official copyright holder of Government of India registration L-139347/2023 for his research prototype: "Decentralized DNS for Spoofing Mitigation (Ethereum)". The architecture utilizes blockchain smart contracts to eliminate single points of failure and mitigate DNS cache poisoning.';
    }

    // ─── 6. Contact, Location, & Hiring ──────────────────────────────────────
    if (q.contains('contact') ||
        q.contains('hire') ||
        q.contains('reach') ||
        q.contains('email') ||
        q.contains('phone') ||
        q.contains('mobile') ||
        q.contains('number') ||
        q.contains('location') ||
        q.contains('where does he live') ||
        q.contains('where is he located') ||
        q.contains('city') ||
        q.contains('linkedin')) {
      return 'You can reach Gangadhar directly via:\n• Email: gangadharpoosarla8@gmail.com\n• Phone: +91 8106707308\n• Location: Visakhapatnam, India\n• LinkedIn: linkedin.com/in/gangadhar-poosarla\nHe is currently open to high-impact Application Security and DevSecOps engineering roles!';
    }

    // ─── 7. J.A.R.V.I.S. On-Device Architecture & Hardware ──────────────────
    if (q.contains('agent') ||
        q.contains('engine') ||
        q.contains('react') ||
        q.contains('how do you work') ||
        q.contains('how does jarvis work') ||
        q.contains('hardware') ||
        q.contains('gtx') ||
        q.contains('1650') ||
        q.contains('8gb') ||
        q.contains('ram') ||
        q.contains('cloud') ||
        q.contains('privacy') ||
        q.contains('leak') ||
        q.contains('on-device')) {
      return 'I am J.A.R.V.I.S., Gangadhar\'s autonomous on-device security agent! Rather than leaking proprietary code to cloud black-boxes, I execute a ReAct (Reasoning & Action) agentic loop locally on his NVIDIA GTX 1650 (4GB VRAM) and 8GB RAM using quantized local SLMs (Qwen 2.5 3B / Llama 3.1 8B). I dynamically plan, invoke tactical ToolSpecs (header auditing, host recon, CVE intelligence), and verify findings with zero cloud leakage!';
    }

    // ─── 8. ToolSpecs & Capabilities ─────────────────────────────────────────
    if (q.contains('tool') ||
        q.contains('capabilities') ||
        q.contains('audit') ||
        q.contains('execute')) {
      return 'My tactical tool suite includes automated HTTP Security Header Auditors (checking HSTS, CSP, X-Frame-Options, CORS), VirtualHost and DNS Route Verifiers, Real-time Host Telemetry, and offline OWASP / CVE Intelligence modules—all executable directly on Gangadhar\'s local machine.';
    }

    // ─── 9. Technical Skills & Arsenal ───────────────────────────────────────
    if (q.contains('skill') ||
        q.contains('stack') ||
        q.contains('tech') ||
        q.contains('language') ||
        q.contains('burp') ||
        q.contains('frida') ||
        q.contains('mobsf') ||
        q.contains('sonarqube') ||
        q.contains('python') ||
        q.contains('apisix') ||
        q.contains('vapt') ||
        q.contains('sast') ||
        q.contains('sca') ||
        q.contains('mobile security')) {
      return 'Gangadhar\'s security arsenal covers:\n• Web & API VAPT: OWASP Top 10, ASVS, Burp Suite, Postman, IDOR/SSRF/Auth bypass detection\n• Mobile Security: MobSF, Frida dynamic instrumentation, Android APK decompilation\n• DevSecOps & Automation: Python security scripting, CycloneDX SBOM generation, SonarQube SAST, Nexus REST APIs\n• Infrastructure & Compliance: Apache APISIX Gateway, Apache CIDR auditing, PCI-DSS, RBI cyber guidelines\n• Languages: Python, Java, Bash, C, JavaScript (Frida hooks)';
    }

    // ─── 10. Specific Projects ────────────────────────────────────────────────
    if (q.contains('project') ||
        q.contains('arsenal') ||
        q.contains('pipeline') ||
        q.contains('sbom') ||
        q.contains('nexus') ||
        q.contains('header auditor') ||
        q.contains('apache') ||
        q.contains('dkms') ||
        q.contains('quantum') ||
        q.contains('crystals') ||
        q.contains('geo-fenc') ||
        q.contains('geofenc')) {
      return 'Gangadhar has engineered 8 flagship security systems:\n1. J.A.R.V.I.S. (On-Device Autonomous AppSec Agent with ReAct loop)\n2. DevSecOps SCA & Supply Chain Pipeline (Nexus API, CycloneDX SBOM, Dependency-Check)\n3. Multi-Threaded Security Header Auditor (Python ThreadPoolExecutor)\n4. Apache VirtualHost Audit Engine (CIDR subnet verification & URL inventory)\n5. Mobile App Dynamic Security Audit Framework (Frida instrumentation)\n6. Geo-fencing Access Control Tool (MaxMind GeoIP + Apache)\n7. Quantum-Resistant Decentralized KMS (DKMS using CRYSTALS-Kyber)\n8. Decentralized DNS Prototype (Ethereum, Copyright L-139347/2023)';
    }

    // ─── 11. Persona / Lore / Who is Gangadhar ────────────────────────────────
    if (q.contains('indian stark') ||
        q.contains('who is gangadhar') ||
        q.contains('who are you') ||
        q.contains('tell me about') ||
        q.contains('bio') ||
        q.contains('summary') ||
        q.contains('about him')) {
      return 'Gangadhar Poosarla—widely known as the "Indian Stark"—is an Application Security Analyst from Visakhapatnam, India. With an offensive mindset and defensive mastery, he specializes in Web/API VAPT, mobile reverse engineering, and custom Python DevSecOps automation. He graduated with a B.Tech in IT from GMRIT in 2024 and currently protects 40+ payment applications at Yalamanchili Solutions for Payments.';
    }

    // ─── 12. Smart Knowledge Fallback ─────────────────────────────────────────
    return 'Understood. Gangadhar is an Application Security Analyst specializing in Web/API VAPT, DevSecOps automation, and on-device AI security. He holds a B.Tech in IT from GMRIT (2024), works at Yalamanchili Solutions for Payments, holds the CTIGA certification, and has reported 30+ vulnerabilities via bug bounty programs. Ask me about his education, experience, projects, skills, or contact info!';
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              if (!isUser)
                                InkWell(
                                  onTap: () => JarvisVoice.speak(msg['text'] ?? ''),
                                  borderRadius: BorderRadius.circular(4),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.volume_up_rounded,
                                          size: 13,
                                          color: isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight,
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          'LISTEN',
                                          style: GoogleFonts.rajdhani(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w700,
                                            color: isDark ? AppTheme.cyberGreen : AppTheme.cyberGreenLight,
                                            letterSpacing: 0.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
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
