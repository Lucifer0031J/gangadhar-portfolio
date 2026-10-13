// ─── Resume Data Model ────────────────────────────────────────────────────────
// Gangadhar Poosarla - Application Security Engineer
// All data extracted from official resume

class ResumeData {
  static const String name = 'GANGADHAR POOSARLA';
  static const String title = 'Application Security Analyst';
  static const String phone = '+91 8106707308';
  static const String email = 'gangadharpoosarla8@gmail.com';
  static const String linkedin = 'linkedin.com/in/gangadhar-poosarla';
  static const String location = 'Visakhapatnam, India';
  static const String apkUrl = 'https://github.com/Lucifer0031J/gangadhar-portfolio/raw/main/app-release.apk';
  static const String jarvisRepo = 'https://github.com/Lucifer0031J/jarvis-local-ai';
  
  // Tony Stark easter egg quote — hidden until user taps the avatar 5x
  static const String starkQuote =
      '"I am Iron Man." — But in this universe, I secure the suit\'s OS. 🔐';

  static const String summary =
      'Application Security Analyst with 1.9 years of experience in web and API VAPT, mobile security, and custom security tooling development. '
      'I specialize in building Python security automation tools for DevSecOps, automating SCA/SBOM vulnerability parsing, HTTP header auditing, and Apache configuration verification. '
      'I don\'t just find vulnerabilities; I build the automated systems to catch them before they ever reach production.';

  static const List<SkillCategory> skills = [
    SkillCategory(
      name: 'Application Security',
      icon: '🛡️',
      color: 0xFF00D4FF,
      items: [
        Skill('Web & API VAPT', 'Expert'),
        Skill('Mobile App Security (MobSF, Frida)', 'Expert'),
        Skill('Secure Code Review (Java/Python)', 'Advanced'),
        Skill('SAST/SCA (SonarQube, SBOM)', 'Advanced'),
        Skill('OWASP Top 10 / ASVS / MASVS', 'Expert'),
      ],
    ),
    SkillCategory(
      name: 'Security Automation & AI',
      icon: '⚙️',
      color: 0xFFFF3B3B,
      items: [
        Skill('Local LLM & AI Red Teaming', 'Advanced'),
        Skill('Python Security Scripting', 'Expert'),
        Skill('REST API Automation', 'Advanced'),
        Skill('Dependency-Check / CycloneDX', 'Working Knowledge'),
        Skill('Apache Config Auditing', 'Advanced'),
      ],
    ),
    SkillCategory(
      name: 'Testing & Compliance',
      icon: '✅',
      color: 0xFFFFB300,
      items: [
        Skill('AuthN/AuthZ & Logic Flaws', 'Expert'),
        Skill('IDOR / SSRF', 'Expert'),
        Skill('PCI-DSS / RBI Guidelines', 'Advanced'),
        Skill('Remediation Tracking', 'Advanced'),
        Skill('Apache APISIX Gateway', 'Working Knowledge'),
      ],
    ),
    SkillCategory(
      name: 'Tooling & Languages',
      icon: '💻',
      color: 0xFF00FF94,
      items: [
        Skill('Python / Java / Bash / C', 'Advanced'),
        Skill('Burp Suite / Postman', 'Expert'),
        Skill('MobSF / Frida (JS)', 'Working Knowledge'),
        Skill('SonarQube', 'Advanced'),
        Skill('Wireshark', 'Working Knowledge'),
      ],
    ),
  ];

  static const List<ResearchItem> research = [
    ResearchItem('Frida Runtime Instrumentation', 'ACTIVE'),
    ResearchItem('Android Banking Security', 'ACTIVE'),
    ResearchItem('SBOM Automation', 'ACTIVE'),
    ResearchItem('Secure SDLC', 'ACTIVE'),
    ResearchItem('AI for AppSec', 'ACTIVE'),
  ];

  static const List<MissionLog> experiences = [
    MissionLog(
      missionId: 'MISSION LOG 001',
      objective: 'Build security automation pipelines and execute enterprise VAPT.',
      company: 'Yalamanchili Solutions for Payments',
      period: 'Jul 2024 – Present',
      location: 'Visakhapatnam, India',
      status: 'ACTIVE',
      color: 0xFF00D4FF,
      results: [
        '✓ Conducted VAPT for 40+ web and API applications (OWASP Top 10, ASVS, PCI-DSS)',
        '✓ Developed a Python-based DevSecOps SCA & Supply Chain Pipeline (Nexus REST APIs, CycloneDX, Dependency-Check)',
        '✓ Engineered a multi-threaded Security & Performance Headers Auditor in Python',
        '✓ Built an automated Apache Config & URL Master Inventory Verifier',
        '✓ Discovered authentication bypass, IDOR, SSRF, and insecure deserialization flaws',
        '✓ Led trial deployment of Apache APISIX as an API gateway for route-level access control & rate limiting',
        '✓ Supported SAST/SCA reviews using SonarQube and SBOM tooling',
      ],
    ),
    MissionLog(
      missionId: 'MISSION LOG 002',
      objective: 'Optimize app performance and refine UI/UX.',
      company: 'WiSeNet Automation Pvt. Ltd.',
      period: 'Nov 2023 – Jan 2024',
      location: 'Visakhapatnam, India',
      status: 'COMPLETED',
      color: 0xFFFFB300,
      results: [
        '✓ Contributed to UI/UX improvements and performance fixes',
        '✓ Meaningfully improved app responsiveness and user adoption',
      ],
    ),
    MissionLog(
      missionId: 'MISSION LOG 003',
      objective: 'Independent vulnerability research & disclosure.',
      company: 'Bug Bounty & Responsible Disclosure',
      period: '2021 – 2024',
      location: 'Student Period',
      status: 'COMPLETED',
      color: 0xFFFF3B3B,
      results: [
        '✓ 15+ vulnerabilities identified across college portal, FacePrep, and SVR Travels',
        '✓ Findings covered authentication weaknesses, session issues, and access control flaws',
      ],
    ),
  ];

  static const List<Project> projects = [
    Project(
      title: 'J.A.R.V.I.S. — On-Device Edge AI Security Assistant',
      description:
          'Private, voice-controlled tactical AI assistant engineered 100% on consumer silicon (NVIDIA GTX 1650 4GB GPU + 8GB RAM). Integrates local Ollama inference (Qwen 2.5 3B / Llama 3.1 8B), Microsoft Edge neural TTS, live hardware telemetry, and dual HTTP/HTTPS gateways for zero-cloud AI red teaming and security research.',
      tags: ['Ollama (Local LLM)', 'Edge Neural TTS', 'Python / Flask', 'AI Red Teaming', 'Web Speech API', 'Hardware Telemetry'],
      icon: '🦾',
      color: 0xFF00D4FF,
      starkComment: 'Engineered on budget hardware because real security pros don\'t trust cloud black-boxes.',
    ),
    Project(
      title: 'DevSecOps SCA & Supply Chain Pipeline',
      description:
          'Automated Nexus inventory extraction, JAR streaming, SBOM parsing, SHA-512 hashing, and clean vs. vulnerable dependency segregation into styled HTML/CSV reports.',
      tags: ['Python', 'Nexus API', 'CycloneDX', 'OWASP Dependency-Check'],
      icon: '🔄',
      color: 0xFF00D4FF,
      starkComment: 'JARVIS handling my supply chain, naturally.',
    ),
    Project(
      title: 'Multi-Threaded Security Header Auditor',
      description:
          'High-throughput HTTP security header scanner featuring fallback execution mechanics, policy scoring, and automated Excel report generation.',
      tags: ['Python', 'ThreadPoolExecutor', 'openpyxl', 'Automation'],
      icon: '🛡️',
      color: 0xFF00FF94,
      starkComment: 'Scanning endpoints faster than a Mark XLII assembly.',
    ),
    Project(
      title: 'Apache VirtualHost Audit Engine',
      description:
          'Automated verification engine parsing Apache proxy rules and cross-referencing master Excel inventories for IP subnet and route discrepancies.',
      tags: ['Python', 'IPv4/v6 CIDR Parsing', 'Apache'],
      icon: '📜',
      color: 0xFFFFB300,
      starkComment: 'Routing rules so tight, not even Ultron could slip through.',
    ),
    Project(
      title: 'Mobile App Dynamic Security Audit Framework',
      description:
          'Dynamic binary instrumentation runner executing custom JavaScript hooks to inspect Android app runtime behaviors against mobile security checklists.',
      tags: ['Python', 'Frida', 'Android', 'Mobile Security'],
      icon: '📱',
      color: 0xFFFF3B3B,
      starkComment: 'Hooking into runtime like patching my own suit.',
    ),
    Project(
      title: 'Geo-fencing Access Control Tool',
      description:
          'Implemented region-based access enforcement using MaxMind GeoIP + Apache configuration; tested in a controlled lab environment.',
      tags: ['GeoIP', 'Apache', 'Access Control', 'Python'],
      icon: '🌐',
      color: 0xFF00D4FF,
      starkComment: 'Location-aware security — even Stark Tower had geo-fencing.',
    ),
    Project(
      title: 'Quantum-Resistant Decentralized KMS (DKMS)',
      description:
          'Research project exploring decentralized key management using Shamir’s Secret Sharing and CRYSTALS-Kyber; includes basic threat modeling.',
      tags: ['Cryptography', 'Quantum-Safe', 'CRYSTALS-Kyber'],
      icon: '🔑',
      color: 0xFF00FF94,
      starkComment: 'Post-quantum encryption. Future-proofing the grid.',
    ),
    Project(
      title: 'Decentralized DNS Prototype',
      description:
          'Research prototype exploring DNS spoofing mitigation via blockchain; independently copyrighted (L-139347/2023).',
      tags: ['Ethereum', 'Blockchain', 'DNS Security'],
      icon: '🔗',
      color: 0xFFFFB300,
      starkComment: 'Decentralized routing. Because central points of failure are a design flaw.',
    ),
  ];

  static const List<Certification> certifications = [
    Certification(
      name: 'Certified Threat Intelligence & Governance Analyst',
      acronym: 'CTIGA',
      issuer: 'Red Team Leaders',
      date: 'Jan 2026',
      icon: '🎖️',
    ),
  ];

  static const Education education = Education(
    degree: 'B.Tech in Information Technology',
    institution: 'GMRIT',
    period: 'Jun 2024',
    icon: '🎓',
  );

  // Tony Stark Easter Eggs — triggered by hidden interactions
  static const List<String> easterEggs = [
    '"Genius, billionaire, playboy, philanthropist." — Well, minus the billionaire part. For now.',
    '"Sometimes you gotta run before you can walk." — I automated it first.',
    '"I am Iron Man." — But I\'m also the one who patches Iron Man\'s suit firmware.',
    '"We have a Hulk." — We also have VAPT, SAST, and threat modeling.',
    '"Friday, it\'s good to be home." — *loads Burp Suite*',
    '"Part of the journey is the end." — Every pentest report has one. Make it count.',
    '"I choose to run towards my problems, not away from them." — Zero-day? Let\'s go.',
    '"Proof that Tony Stark has a heart." — Mine beats fastest when I find a critical CVE.',
  ];
}

// ─── Data Classes ─────────────────────────────────────────────────────────────

class SkillCategory {
  final String name;
  final String icon;
  final int color;
  final List<Skill> items;
  const SkillCategory({required this.name, required this.icon, required this.color, required this.items});
}

class Skill {
  final String name;
  final String level; 
  const Skill(this.name, this.level);
}

class ResearchItem {
  final String title;
  final String status;
  const ResearchItem(this.title, this.status);
}

class MissionLog {
  final String missionId;
  final String objective;
  final String company;
  final String period;
  final String location;
  final String status;
  final int color;
  final List<String> results;
  const MissionLog({
    required this.missionId, required this.objective, required this.company,
    required this.period, required this.location, required this.status, required this.color,
    required this.results,
  });
}

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String icon;
  final int color;
  final String starkComment;
  const Project({
    required this.title, required this.description, required this.tags,
    required this.icon, required this.color, required this.starkComment,
  });
}

class Certification {
  final String name;
  final String acronym;
  final String issuer;
  final String date;
  final String icon;
  const Certification({
    required this.name, required this.acronym, required this.issuer,
    required this.date, required this.icon,
  });
}

class Education {
  final String degree;
  final String institution;
  final String period;
  final String icon;
  const Education({
    required this.degree, required this.institution,
    required this.period, required this.icon,
  });
}
